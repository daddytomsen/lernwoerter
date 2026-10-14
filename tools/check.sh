#!/usr/bin/env bash
# Prüft Schreibfuchs vor jedem Commit: JS-Syntax, Schriftdateien, nichts Privates im öffentlichen Repo.
set -euo pipefail
cd "$(dirname "$0")/.."
tmp="$(mktemp -d "${TMPDIR:-/tmp}/lernwoerter.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT

python3 - "$tmp" <<'PY'
import os, re, sys
html = open('index.html', encoding='utf-8').read()
scripts = re.findall(r'<script>([\s\S]*?)</script>', html)
assert len(scripts) == 1, 'index.html: genau ein <script>-Block erwartet'
open(os.path.join(sys.argv[1], 'app.js'), 'w', encoding='utf-8').write(scripts[0])
for f in re.findall(r'url\((fonts/[^)]+)\)', html):
    assert os.path.isfile(f), f'Schrift fehlt: {f}'
    print(f'  {f}: {os.path.getsize(f)} Byte')
for lic in ('fonts/OFL-Andika.txt', 'fonts/OFL-Playwrite.txt'):
    assert os.path.isfile(lic), f'Lizenztext fehlt: {lic}'
print('  Version', re.search(r"const VERSION = '([^']+)'", html).group(1))
PY

node --check "$tmp/app.js"

# Öffentliches Repo: keine Fotos, keine Sicherungen, kein Entwurfsordner. Erlaubt sind nur die App-Icons.
if git rev-parse --git-dir >/dev/null 2>&1; then
  bad="$(git ls-files --cached --others --exclude-standard \
    | grep -Ei '\.(jpe?g|png|heic|webp|gif)$|sicherung|^entwurf/|^fotos/' \
    | grep -Ev '^(apple-touch-icon|icon-192|icon-512)\.png$' || true)"
  if [ -n "$bad" ]; then echo "Private Dateien würden ins Repo gehen:"; echo "$bad"; exit 1; fi
fi
echo "  ok"
