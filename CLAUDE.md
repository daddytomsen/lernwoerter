# Schreibfuchs – Projektwissen für Claude Code

Lernwörter-App für ein Kind in Klasse 2 (NRW), als Web-App für das iPad (Safari → „Zum Home-Bildschirm“), gehostet auf GitHub Pages. Der Auftrag steht in `KONZEPT.md`, offene Aufgaben und Entscheidungen stehen in `HANDOFF.md`. Vorbild ist Voc a Bit in `~/Downloads/wordbox`: Muster übernehmen, Code gezielt kopieren, dort nie etwas ändern.

Repo und interne Schlüssel heißen neutral `lernwoerter` (Speicher `lernwoerter.*`, Cache `lernwoerter-v…`), der App-Name „Schreibfuchs“ steht nur in sichtbaren Texten. So bleiben Pages-Adresse und Lernstand gültig, falls sich der Name ändert (Lehre aus der Umbenennung Word Box → Voc a Bit).

## Grundsätze

- **Eine Datei je Seite:** Die App steckt in `index.html` (CSS, SVG, JS), der Stift-Prüfstand in `werkstatt.html`. Kein Framework, kein Bundler, keine externen Skripte, keine Schriften aus dem Netz.
- **Vanilla JS**, ES2019+, iPadOS-Safari ab 15. Keine Module, keine Top-Level-`await`.
- **Oberfläche Deutsch**, Du-Form, für ein Kind: wenig Text, große Ziele (mindestens 64 px), alles vorlesbar.
- **Handschrift bleibt Kern:** Wo geschrieben wird, wird mit Stift oder Finger geschrieben, nie getippt. Belohnung ohne Druck, keine roten Kreuze, Fehler heißen „Nochmal probieren“ mit sanftem Ton.
- **Lernstand nur im Gerät.** Nichts verschicken, keine Analytics, keine Cookies.
- **Repo ist öffentlich:** keine Namen von Kindern (auch nicht in Code, Tests, Commits, HANDOFF), keine Fotos, keine Schreibproben, keine Sicherungen. `entwurf/` ist lokal und ignoriert. Der Name des Kindes wird nur in der App im Elternbereich eingetragen.
- Vor jedem Commit `tools/check.sh`.

## Dateien

| Datei | Inhalt |
|---|---|
| `index.html` | die App (ab M1, Version in `const VERSION`) |
| `werkstatt.html` | Werkstatt-Test M0: Stiftdiagnose, Lineatur, Nachspur-Bewertung, Scribble-Prüfung, Bericht. Bleibt als Prüfstand, verlinkt im Elternbereich |
| `sw.js` | Service Worker: Seiten network-first, Schriften und Rest cache-first, Kern im Cache beim Installieren |
| `manifest.webmanifest` | Home-Bildschirm (Icons folgen in M6) |
| `fonts/` | `playwrite-de-grund.woff2`, `andika-latin.woff2` (Google-Fonts-Ausgaben) und die OFL-Lizenztexte |
| `tools/check.sh` | JS-Syntax beider Seiten und `sw.js`, Schriften, Cache-Kern vorhanden, gleiche Version, keine privaten Dateien |
| `KONZEPT.md` | Auftrag (pädagogische Grundlage, Stationen, Fahrplan) |
| `entwurf/` | lokal: Foto des ersten Arbeitsblatts (`Lernwörter 1`), nie ins Repo |

## Release-Regel

Bei jeder Änderung an `index.html`, `werkstatt.html` oder den Schriften **beide Versionsnummern gleichzeitig** hochzählen, sonst bekommt das iPad die alte Fassung aus dem Cache:

- `sw.js`: `const CACHE = 'lernwoerter-v0.1';`
- `index.html`: `const VERSION = '0.1';` (sichtbar im Elternbereich)

`tools/check.sh` bricht ab, wenn sie nicht übereinstimmen. Nach jedem Update muss die Home-Bildschirm-App komplett geschlossen und zweimal geöffnet werden. Das gehört in jede Release-Nachricht an Thomas.

## Aufbau von `index.html`

Abschnitte im Skript (Kommentare `/* ---------- … ---------- */`):

1. **helpers** – `esc()`, `icon()`, `store` (localStorage mit try/catch), `toast()`, `uid()`.
2. **calendar days** – `dayStart`, `dayShift`, `isoDay`, `parseDay`, `tageBis`, `naechsterFreitag()`. Immer Kalendertage, nie „+24 h“.
3. **words** – `tokens()`: Selbstlaut-Gruppen (au, äu, ei, eu, ai, ie, aa, ee, oo) und sch/ch/ck/ph/qu sind je eine Einheit. `silbenVorschlag()` mit Schulregel (ein Mitlaut zur nächsten Silbe, von mehreren nur der letzte). `stellenVorschlag()` erkennt sp/st am Anfang, ie, ck, tz, Doppelmitlaut nach Selbstlaut, Dehnungs-h vor l/m/n/r, ä/äu (ableiten), v, ß, Doppelselbstlaut, Auslaut d/b/g (verlängern). `artVorschlag()` → FRESCH-Art. Alles nur Vorschläge, die Eltern prüfen. Bekannte Grenzen: „Fa-mi-lie“ (statt li-e), „Käse“ als ableiten.
4. **import** – `importPrompt()` (Anleitung für Claude), `parseImport()` (JSON auch im ```-Block, Arrays erlaubt). Stellen kommen als `{ zeichen, typ, tipp, nr }` und werden in `{ von, bis }` umgerechnet (`stelleAus()`), weil Buchstaben zählen für ein Sprachmodell unzuverlässig ist. Silben werden nur übernommen, wenn sie zusammen genau das Wort ergeben.
5. **state & persistence** – `S` (Ansicht und Entwürfe), `S.prof`, `S.D` (Daten des aktiven Kindes). `aktuelleWoche()` = nächstes Diktat ab heute, sonst das letzte.
6. **sound & speech** – wie Voc a Bit: Ton beim ersten Tippen freischalten, `say()` synchron aus dem Tipp-Handler, deutsche Stimme bevorzugt lokal. Sanfter Ton statt Fehlerton.
7. **files** – `downloadFile()` über das Teilen-Menü, `copyText()`.
8. **pictures** – Fuchs und Themenbilder als Inline-SVG.
9. **views** – Kind: `viewStart`, `viewKarte`, `viewStation` (silben, koenige). Erster Start: `viewOnboard`, `viewWer`. Eltern: `viewGate`, `viewEltern` (Wochen, Einstellungen, Sicherung), `viewImport`, `viewWoche`, `viewWortEdit`.
10. **render / actions / events** – `render()` → `#app.innerHTML`; der Wort-Editor rendert beim Tippen nur `#wedit-teil` neu (Fokus bleibt). Ereignisse über `data-act` (Klick, Tabelle `ACT`), `data-in` (`IN`), `data-ch` (`CH`).

`?debug` setzt `window.sf` (Zustand und Wortfunktionen) für lokale Prüfungen.

## Datenmodell

- **Profile** `localStorage['lernwoerter.profile.v1']`: `{ aktiv, liste: [{ id, name, lefty, schrift: grund|andika, thema: einhorn|halloween|tiere, band }] }`.
- **Daten je Kind** `localStorage['lernwoerter.daten.<profil-id>.v1']`: `{ v: 1, woerter: { id: Wort }, wochen: [Woche], stand: { sterne, tage: { JJJJ-MM-TT: sterne } } }`.
- **Wort:** `{ id, wort, artikel, wortart: nomen|verb|adjektiv|andere, art: mitsprech|nachdenk|merk, silben: ["A","bend"], stellen: [{ von, bis, typ, tipp }], satz }`. Ids sind fest, der Lernstand hängt daran. Gleiches Wort (Artikel + Wort, ohne Groß/klein) behält beim Speichern einer Woche seine Id.
- **Woche:** `{ id, titel, diktat: "JJJJ-MM-TT", woerter: [ids], fehlerwoerter: [ids], angelegt }`.
- **Sicherung:** `{ app: "lernwoerter", v: 1, exported, profile, daten: { profil-id: Daten } }`, Dateiname `schreibfuchs-sicherung-JJJJ-MM-TT.json`.

## Elternbereich

Zugang nur über eine Rechenaufgabe: zweistellig × einstellig mit Ergebnis über 100 (`neueAufgabe()`), Eingabe über Ziffernfeld, falsche Antwort → neue Aufgabe. 7 × 8 o. ä. reicht nicht, das Einmaleins lernt man in NRW in Klasse 2.

## Schrift und Lineatur

- Lineatur wie auf dem Arbeitsblatt der Schule gemessen: vier Linien, drei gleich hohe Bänder, Grundlinie fett, kein farbiges Mittelband (abschaltbar vorhanden).
- Die Vorlage wird so groß gesetzt, dass die x-Höhe genau das Mittelband füllt (`xRatio()` in `werkstatt.html`). Playwrite DE Grund passt dazu fast genau (Oberlänge 1,87, Unterlänge 0,87 Bänder), Andika nicht (1,54 / 0,47).
- Kronen der Silbenkönige: Höhe nach Buchstabenart (`kronenKlasse()`: klein, mit Punkt [äöüi], groß), berechnet aus den Schriftmaßen bei Zeilenhöhe 1,5.
- Die Playwrite-DE-Familie hat auch LA, VA und SAS (verbundene Schriften in NRW). Ein späterer Wechsel ist nur eine weitere Schriftdatei.

## Schreibfläche (aus M0, Muster für M2)

- `Pad` in `werkstatt.html`: zwei Canvas übereinander (Hintergrund mit Lineatur und Vorlage, Tinte). Striche als Punktlisten `[x, y, druck]` in CSS-Pixeln, gespeichert vereinfacht (Ramer-Douglas-Peucker) in Hundertstel-Band (`pack()`).
- Handballen: Sobald einmal `pointerType === 'pen'` kam, werden `touch`-Zeiger auf allen Flächen ignoriert. Nur ein Zeiger gleichzeitig. Das Kind ist Linkshänderin: Vorlage rechts, die Hand liegt auf dem schon Geschriebenen.
- iOS: `touch-action:none` und `preventDefault` auf `touchstart`/`touchmove` der Fläche, sonst stören Lupe, Textauswahl und Scribble. `getCoalescedEvents()` wird genutzt, wenn vorhanden.
- Druckstärke nur, wenn der Stift wirklich unterschiedliche Werte liefert (`pressureVaries()`), sonst feste Strichbreite.

## Nachspur-Bewertung

`bewerteSpur(pad)`: Vorlage und Tinte werden auf ein grobes Raster gezeichnet (Zelle ≈ Band/12), je Maske ein Abstandsfeld (Chamfer, zwei Durchläufe). Genauigkeit = Anteil Tinte nahe der Vorlage, Abdeckung = Anteil Vorlage nahe der Tinte, Toleranz 0,15 Band. Synthetische Tests (`werkstatt.html?debug`): genau 100/100, zittrig ≥ 73/92, daneben und Gekritzel ≤ 48/62. `sterneFuerSpur()`: der schwächere Wert zählt, ≥ 0,85 → 3, ≥ 0,65 → 2, sonst 1 Stern. Echte Werte vom iPad stehen in `HANDOFF.md`.

## Lokal testen

Direkt aus `~/Downloads` liefert der Vorschau-Server 404. Darum spiegeln:

```bash
rsync -a --delete --exclude entwurf --exclude .git --exclude .claude ~/Downloads/lernwoerter/ /tmp/claude-501/lernwoerter-mirror/
```

Dann in Claude Code `preview_start` mit dem Namen `lernwoerter` (Port 8794, Eintrag in `~/Downloads/.claude/launch.json`). Der Service Worker läuft nur unter https, lokal also nicht. Ist die Vorschau ausgeblendet, läuft `requestAnimationFrame` nicht: Werte dann synchron abfragen. Testdaten danach aus dem localStorage der Vorschau löschen.

## Git

Repo `daddytomsen/lernwoerter` (öffentlich), Pages aus `main`. Größere Meilensteine auf einem eigenen Zweig (`m1` …), solange auf `main` ein Test von Thomas läuft. `git commit` und `gh` außerhalb der Sandbox (Schlüsselbund, Zertifikate). Commits mit den Attributionszeilen aus dem System-Hinweis.
