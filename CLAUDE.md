# Schreibfuchs – Projektwissen für Claude Code

Lernwörter-App für ein Kind in Klasse 2 (NRW), als Web-App für das iPad (Safari → „Zum Home-Bildschirm“), gehostet auf GitHub Pages. Der Auftrag steht in `KONZEPT.md`, offene Aufgaben und Entscheidungen stehen in `HANDOFF.md`. Vorbild ist Voc a Bit in `~/Downloads/wordbox`: Muster übernehmen, Code gezielt kopieren, dort nie etwas ändern.

Repo und interne Schlüssel heißen neutral `lernwoerter` (Speicher `lernwoerter.*`), der App-Name „Schreibfuchs“ steht nur in sichtbaren Texten. So bleiben Pages-Adresse und Lernstand gültig, falls sich der Name ändert (Lehre aus der Umbenennung Word Box → Voc a Bit).

## Grundsätze

- **Eine Datei:** Die App steckt in `index.html` (CSS, SVG, JS). Kein Framework, kein Bundler, keine externen Skripte, keine Schriften aus dem Netz.
- **Vanilla JS**, ES2019+, iPadOS-Safari ab 15. Keine Module, keine Top-Level-`await`.
- **Oberfläche Deutsch**, Du-Form, für ein Kind: wenig Text, große Ziele (mindestens 60 pt), Vorlesen.
- **Handschrift bleibt Kern:** Wo geschrieben wird, wird mit Stift oder Finger geschrieben, nie getippt. Belohnung ohne Druck, keine roten Kreuze.
- **Lernstand nur im Gerät.** Nichts verschicken, keine Analytics, keine Cookies.
- **Repo ist öffentlich:** keine Namen von Kindern, keine Fotos, keine Schreibproben, keine Sicherungen. `entwurf/` ist lokal und ignoriert.
- Vor jedem Commit `tools/check.sh`.

## Dateien

| Datei | Inhalt |
|---|---|
| `index.html` | zurzeit der Werkstatt-Test M0 (5 Reiter), ab M1 die App |
| `fonts/` | `playwrite-de-grund.woff2`, `andika-latin.woff2` (Google-Fonts-Ausgaben) und die OFL-Lizenztexte |
| `tools/check.sh` | JS-Syntax, Schriftdateien da, keine privaten Dateien im Repo |
| `KONZEPT.md` | Auftrag (pädagogische Grundlage, Stationen, Fahrplan) |
| `entwurf/` | lokal: Foto des ersten Arbeitsblatts (`Lernwörter 1`), nie ins Repo |

## Schrift und Lineatur (Stand M0)

- Lineatur wie auf dem Arbeitsblatt der Schule gemessen: vier Linien, drei gleich hohe Bänder, Grundlinie fett, kein farbiges Mittelband (abschaltbar vorhanden).
- Die Vorlage wird so groß gesetzt, dass die x-Höhe genau das Mittelband füllt (`xRatio()` misst sie per `measureText`). Playwrite DE Grund passt dazu fast genau (Oberlänge 1,87, Unterlänge 0,87 Bänder), Andika nicht (1,54 / 0,47).
- Die Playwrite-DE-Familie hat auch LA, VA und SAS (verbundene Schriften in NRW). Ein späterer Wechsel ist nur eine weitere Schriftdatei.

## Schreibfläche (Muster für M2)

- `Pad`: zwei Canvas übereinander (Hintergrund mit Lineatur und Vorlage, Tinte). Striche als Punktlisten `[x, y, druck]` in CSS-Pixeln, gespeichert vereinfacht (Ramer-Douglas-Peucker) in Hundertstel-Band (`pack()`).
- Handballen: Sobald einmal `pointerType === 'pen'` kam, werden `touch`-Zeiger auf allen Flächen ignoriert. Nur ein Zeiger gleichzeitig.
- iOS: `touch-action:none` und `preventDefault` auf `touchstart`/`touchmove` der Fläche, sonst stören Lupe, Textauswahl und Scribble. `getCoalescedEvents()` wird genutzt, wenn vorhanden.
- Druckstärke nur, wenn der Stift wirklich unterschiedliche Werte liefert (`pressureVaries()`), sonst feste Strichbreite.

## Nachspur-Bewertung

`bewerteSpur(pad)`: Vorlage und Tinte werden auf ein grobes Raster gezeichnet (Zelle ≈ Band/12), je Maske ein Abstandsfeld (Chamfer, zwei Durchläufe). Genauigkeit = Anteil Tinte nahe der Vorlage, Abdeckung = Anteil Vorlage nahe der Tinte, Toleranz 0,15 Band. Synthetische Tests (Testseite mit `?debug`): genau 100/100, zittrig ≥ 73/92, daneben und Gekritzel ≤ 48/62. `sterneFuerSpur()`: der schwächere Wert zählt, ≥ 0,85 → 3, ≥ 0,65 → 2, sonst 1 Stern. Echte Werte vom iPad stehen in `HANDOFF.md`.

## Lokal testen

Direkt aus `~/Downloads` liefert der Vorschau-Server 404. Darum spiegeln:

```bash
rsync -a --delete --exclude entwurf --exclude .git ~/Downloads/lernwoerter/ /tmp/claude-501/lernwoerter-mirror/
```

Dann in Claude Code `preview_start` mit dem Namen `lernwoerter` (Port 8794, Eintrag in `~/Downloads/.claude/launch.json`). `?debug` blendet die Test-Knöpfe ein und setzt `window.m0`. Ist die Vorschau ausgeblendet, läuft `requestAnimationFrame` nicht: Werte dann synchron abfragen (z. B. über den Bericht).

## Git

`git init` und `git commit` außerhalb der Sandbox, `git push` mit `allowed_domains: github.com`. Repo anlegen und Pages einschalten macht Thomas selbst. Commits mit den Attributionszeilen aus dem System-Hinweis.
