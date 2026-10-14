#!/usr/bin/env bash
# Prüft Schreibfuchs vor jedem Commit: JS-Syntax beider Seiten und des Service Workers, Schriften,
# Cache-Kern, gleiche Version in sw.js und index.html, nichts Privates im öffentlichen Repo.
set -euo pipefail
cd "$(dirname "$0")/.."
tmp="$(mktemp -d "${TMPDIR:-/tmp}/lernwoerter.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT

python3 - "$tmp" <<'PY'
import json, os, re, sys
tmp = sys.argv[1]
for page in ('index.html', 'werkstatt.html'):
    html = open(page, encoding='utf-8').read()
    scripts = re.findall(r'<script>([\s\S]*?)</script>', html)
    assert len(scripts) == 1, f'{page}: genau ein <script>-Block erwartet'
    open(os.path.join(tmp, page + '.js'), 'w', encoding='utf-8').write(scripts[0])
    for f in re.findall(r'url\((fonts/[^)]+)\)', html):
        assert os.path.isfile(f), f'{page}: Schrift fehlt: {f}'
for lic in ('fonts/OFL-Andika.txt', 'fonts/OFL-Playwrite.txt'):
    assert os.path.isfile(lic), f'Lizenztext fehlt: {lic}'
json.load(open('manifest.webmanifest', encoding='utf-8'))
sw = open('sw.js', encoding='utf-8').read()
for f in re.findall(r"'\./([^']+)'", sw):
    assert os.path.isfile(f), f'sw.js: Datei im Cache-Kern fehlt: {f}'
cache = re.search(r"CACHE = 'lernwoerter-v([\d.]+)'", sw).group(1)
shown = re.search(r"const VERSION = '([\d.]+)'", open('index.html', encoding='utf-8').read()).group(1)
assert cache == shown, f'Version passt nicht: sw.js {cache}, index.html {shown}'
print(f'  Version {shown} (sw.js und index.html gleich)')
# Weekly word lists for "Neue Wochen laden"
if os.path.isdir('wochen'):
    idx = json.load(open('wochen/index.json', encoding='utf-8'))['wochen']
    ids = [x['id'] for x in idx]
    assert len(ids) == len(set(ids)), 'wochen/index.json: doppelte id'
    for x in idx:
        wk = json.load(open('wochen/' + x['datei'], encoding='utf-8'))
        for w in wk['woerter']:
            assert w.get('wort'), f"{x['datei']}: Wort fehlt"
            if w.get('silben'):
                assert ''.join(w['silben']) == w['wort'], f"{x['datei']}: Silben ergeben nicht {w['wort']}"
            for st in w.get('stellen', []):
                assert st['zeichen'] in w['wort'], f"{x['datei']}: Stelle {st['zeichen']} nicht in {w['wort']}"
        for t in x.get('schulDiktatFalsch', []):
            assert any(t.lower() in (w['wort'].lower(), (w.get('artikel', '') + ' ' + w['wort']).strip().lower()) for w in wk['woerter']), f"{x['datei']}: Schul-Diktat-Wort {t} fehlt"
        print(f"  wochen/{x['datei']}: {len(wk['woerter'])} Wörter, rev {x.get('rev', 1)}")
PY

for js in "$tmp"/*.js; do node --check "$js"; done
node --check sw.js

# Öffentliches Repo: keine Fotos, keine Sicherungen, kein Entwurfsordner. Erlaubt sind nur die App-Icons.
if git rev-parse --git-dir >/dev/null 2>&1; then
  bad="$(git ls-files --cached --others --exclude-standard \
    | grep -Ei '\.(jpe?g|png|heic|webp|gif)$|sicherung|^entwurf/|^fotos/' \
    | grep -Ev '^(apple-touch-icon|icon-192|icon-512)\.png$' || true)"
  if [ -n "$bad" ]; then echo "Private Dateien würden ins Repo gehen:"; echo "$bad"; exit 1; fi
  # Names of the children live only in tools/namen.local.txt (ignored by git, one name per line).
  if [ -s tools/namen.local.txt ]; then
    treffer="$(git ls-files --cached --others --exclude-standard -z | xargs -0 grep -liwFf tools/namen.local.txt 2>/dev/null || true)"
    if [ -n "$treffer" ]; then echo "Ein Kindername steht in diesen Dateien:"; echo "$treffer"; exit 1; fi
  fi
fi
echo "  ok"
