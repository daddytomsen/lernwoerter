# Schreibfuchs – Projektwissen für Claude Code

Lernwörter-App für ein Kind in Klasse 2 (NRW), als Web-App für das iPad (Safari → „Zum Home-Bildschirm“), gehostet auf GitHub Pages. Der Auftrag steht in `KONZEPT.md`, offene Aufgaben und Entscheidungen stehen in `HANDOFF.md`. Vorbild ist Voc a Bit in `~/Downloads/wordbox`: Muster übernehmen, Code gezielt kopieren, dort nie etwas ändern.

Repo und interne Schlüssel heißen neutral `lernwoerter` (Speicher `lernwoerter.*`, Cache `lernwoerter-v…`), der App-Name „Schreibfuchs“ steht nur in sichtbaren Texten. So bleiben Pages-Adresse und Lernstand gültig, falls sich der Name ändert (Lehre aus der Umbenennung Word Box → Voc a Bit).

## Grundsätze

- **Eine Datei je Seite:** Die App steckt in `index.html` (CSS, SVG, JS), der Stift-Prüfstand in `werkstatt.html`. Kein Framework, kein Bundler, keine externen Skripte, keine Schriften aus dem Netz.
- **Vanilla JS**, ES2019+, iPadOS-Safari ab 15. Keine Module, keine Top-Level-`await`.
- **Oberfläche Deutsch**, Du-Form, für ein Kind: wenig Text, große Ziele (mindestens 64 px), alles vorlesbar.
- **Handschrift bleibt Kern:** Wo geschrieben wird, wird mit Stift oder Finger geschrieben, nie getippt. Belohnung ohne Druck, keine roten Kreuze, Fehler heißen „Nochmal probieren“ mit sanftem Ton.
- **Lernstand nur im Gerät.** Nichts verschicken, keine Analytics, keine Cookies.
- **Repo ist öffentlich:** keine Namen von Kindern (auch nicht in Code, Tests, Commits, HANDOFF), keine Fotos, keine Schreibproben, keine Sicherungen. `entwurf/` ist lokal und ignoriert. Der Name des Kindes wird nur in der App im Elternbereich eingetragen. `tools/check.sh` bricht ab, wenn ein Name aus `tools/namen.local.txt` (lokal, von Git ignoriert, ein Name je Zeile) in einer Repo-Datei steht. Fehlt die Datei auf einem neuen Rechner, Thomas nach den Namen fragen.
- Vor jedem Commit `tools/check.sh`.

## Dateien

| Datei | Inhalt |
|---|---|
| `index.html` | die App (ab M1, Version in `const VERSION`) |
| `werkstatt.html` | Werkstatt-Test M0: Stiftdiagnose, Lineatur, Nachspur-Bewertung, Scribble-Prüfung, Bericht. Bleibt als Prüfstand, verlinkt im Elternbereich |
| `sw.js` | Service Worker: Seiten network-first, Schriften und Rest cache-first, Kern im Cache beim Installieren |
| `manifest.webmanifest` | Home-Bildschirm, Icons 192/512 (auch maskable) |
| `icon.svg`, `apple-touch-icon.png` (180), `icon-192.png`, `icon-512.png` | App-Icon: Fuchs über Schul-Lineatur mit Stift. `icon.svg` ist die Quelle; PNGs im Browser per Canvas gerendert, randlos und ohne Alphakanal (iOS füllt Transparenz schwarz) |
| `fonts/` | `playwrite-de-grund.woff2`, `andika-latin.woff2` (Google-Fonts-Ausgaben) und die OFL-Lizenztexte |
| `wochen/index.json`, `wochen/*.json` | Lernwörter-Wochen der Schule zum Übernehmen in der App („Neue Wochen bereit“), siehe unten |
| `tools/check.sh` | JS-Syntax beider Seiten und `sw.js`, Schriften, Cache-Kern vorhanden, gleiche Version, keine privaten Dateien, keine Kindernamen |
| `KONZEPT.md` | Auftrag (pädagogische Grundlage, Stationen, Fahrplan) |
| `entwurf/` | lokal: Foto des ersten Arbeitsblatts (`Lernwörter 1`), nie ins Repo |

## Release-Regel

Bei jeder Änderung an `index.html`, `werkstatt.html` oder den Schriften **beide Versionsnummern gleichzeitig** hochzählen, sonst bekommt das iPad die alte Fassung aus dem Cache:

- `sw.js`: `const CACHE = 'lernwoerter-v0.10';`
- `index.html`: `const VERSION = '0.10';` (sichtbar im Elternbereich)

`tools/check.sh` bricht ab, wenn sie nicht übereinstimmen. Neue oder korrigierte Wochen in `wochen/` brauchen **keinen** neuen Release (der Service Worker holt `wochen/` immer zuerst aus dem Netz). Nach jedem Update muss die Home-Bildschirm-App komplett geschlossen und zweimal geöffnet werden. Das gehört in jede Release-Nachricht an Thomas.

## Aufbau von `index.html`

Abschnitte im Skript (Kommentare `/* ---------- … ---------- */`):

1. **helpers** – `esc()`, `icon()`, `store` (localStorage mit try/catch), `toast()`, `uid()`.
2. **calendar days** – `dayStart`, `dayShift`, `isoDay`, `parseDay`, `tageBis`, `naechsterFreitag()`. Immer Kalendertage, nie „+24 h“. Alle Lernlogik fragt `jetzt()` / `heute()`; `zeitVersatz` verschiebt um ganze Tage (nur `?debug`, `sf.tag(1)` = morgen).
3. **words** – `tokens()`: Selbstlaut-Gruppen (au, äu, ei, eu, ai, ie, aa, ee, oo) und sch/ch/ck/ph/qu sind je eine Einheit. `silbenVorschlag()` mit Schulregel (ein Mitlaut zur nächsten Silbe, von mehreren nur der letzte). `stellenVorschlag()` erkennt sp/st am Anfang, ie, ck, tz, Doppelmitlaut nach Selbstlaut, Dehnungs-h vor l/m/n/r, ä/äu (ableiten), v, ß, Doppelselbstlaut, Auslaut d/b/g (verlängern). `artVorschlag()` → FRESCH-Art. Alles nur Vorschläge, die Eltern prüfen. Bekannte Grenzen: „Fa-mi-lie“ (statt li-e), „Käse“ als ableiten.
4. **import** – `importPrompt()` (Anleitung für Claude), `parseImport()` (JSON auch im ```-Block, Arrays erlaubt). Stellen kommen als `{ zeichen, typ, tipp, nr }` und werden in `{ von, bis }` umgerechnet (`stelleAus()`), weil Buchstaben zählen für ein Sprachmodell unzuverlässig ist. Silben werden nur übernommen, wenn sie zusammen genau das Wort ergeben.
5. **state & persistence** – `S` (Ansicht und Entwürfe), `S.prof`, `S.D` (Daten des aktiven Kindes). `aktuelleWoche()` = nächstes Diktat ab heute, sonst das letzte. `ladeDaten()` ergänzt fehlende Felder älterer Stände (`leererStand()`).
6. **Karteikasten** – `WARTE = [0, 0, 1, 1, 1, 7]` (Tempo „Schnell“ wie Voc a Bit 1.12). `bewerte(id, ok, fehler)`: richtig und fällig → ein Fach hoch, fällig nach `WARTE[fach]` Kalendertagen, höchstens ein Fach pro Tag; neu und richtig → Fach 2; falsch → Fach 1, heute fällig. **Nur Blitzlesen und Merk-Diktat rufen `bewerte()`** (später auch das Mini-Diktat). Abschreiben notiert nur Fehlerstellen (`notiereFehler()`). `rundeAusDemKopf(5)`: feste Anteile (höchstens die Hälfte fällig, dann neu, dann weitere fällige, dann Rest), heute schon richtige Wörter nicht; fällige Wörter aus älteren Wochen kommen mit. `rundeReihum(typ, 5)`: Abschreiben und Regenbogen nehmen die Wörter der Woche der Reihe nach (`stand.rot`).
7. **sound & speech** – wie Voc a Bit: Ton beim ersten Tippen freischalten, `say()` synchron aus dem Tipp-Handler, deutsche Stimme bevorzugt lokal. Sanfter Ton statt Fehlerton.
8. **files** – `downloadFile()` über das Teilen-Menü, `copyText()`.
9. **writing attempts** – IndexedDB `lernwoerter` / Store `versuche` (Index `[profil, wort]`), je Wort die letzten 3: `{ profil, wort, station, zeit, tag, band, striche (pack), selbst, fehler | spur }`. Für die Eltern-Durchsicht in M4. Nicht in der Sicherung.
10. **writing pad** – `Pad` aus `werkstatt.html` übernommen, liest Band, Schrift und Linkshänder aus dem Profil. Striche tragen `pass` (Regenbogen-Durchgang); `undo`/`clear` wirken nur auf den aktuellen Durchgang. Handballen: nach Stift werden Finger ignoriert; drei Fingertipps in 5 s bei 20 s Stiftpause schalten Finger wieder an. `bewerteSpur(pad, pass)` und `sterneFuerSpur()` wie im Werkstatt-Test.
11. **pictures** – Fuchs und Themenbilder als Inline-SVG.
12. **views** – Kind: `viewStart` (Kacheln in vier Gruppen aus `STATIONEN`, Stationen mit leerem `poolFuer()` ausgeblendet; Karteikasten `kastenHtml`), `viewKarte`, `viewStation` (silben, koenige) und `viewSchreiben` (abschreiben, regenbogen, blitz, merk). Phasen der Schreibstationen: zeigen (Merk-Diktat) bzw. blitzbereit → blitz (Blitzlesen, 1,2 s + 80 ms je Zeichen, höchstens 2,5 s, bis zu 3 Blitze vor dem ersten Strich) bzw. pause (Fuchs läuft 2,6 s) → schreiben → pruefen (Selbstkontrolle: Buchstaben erscheinen nacheinander, Antippen markiert direkt im DOM ohne Neu-Rendern) → nochmal (nach Fehlern einmal mit Vorlage richtig abschreiben) → ergebnis. Erster Start: `viewOnboard`, `viewWer`. Eltern: `viewGate`, `viewEltern` (Wochen, Einstellungen, Sicherung), `viewImport`, `viewWoche`, `viewWortEdit`.
    **Knobel-Stationen (M3)** in `viewKnobel`, Start je Wort in `knobelBeginnen()`:
    - *Baukasten*: Bausteine = `tokens()` (au, ei, ie, sch, ch, ck … bleiben ein Stein), dazu 1–3 Ablenker aus `ablenker()`: zuerst die falschen Zwillinge der eigenen Stellen (`alternative()`: d→t, ie→i, ck→k, tz→z, ä→e, v→f …), dann `VERWECHSLER`. Antippen legt in den nächsten freien Platz, Platz antippen legt zurück. Falsche Plätze wackeln und leeren sich nach 1,2 s, nach drei Versuchen legt die App das Wort.
    - *Lückenwort*: erste Stelle mit Zwilling (`lueckenStelle()`), zwei Optionen, Dehnungs-h als „ohne h“. Tipp aus der Stelle.
    - *Wortarten*: Wort ohne Artikel (und ohne Vorlesen des Artikels!), drei Kisten in Schulfarben, bei Nomen danach der/die/das. Wörter mit `wortart: andere` nehmen nicht teil.
    - *Knifflige Stelle*: jeder Buchstabe eine Kachel, ein Treffer markiert die ganze Stelle gelb; nach vier Fehltipps zeigt die App die Stellen. Danach die Tipps aller Stellen.
    Sterne: 2 beim ersten Versuch, 1 nach Fehlern, 0 wenn die App helfen musste.
    **Woche und Diktat (M4)**:
    - *Wochenweg* (`wochenwegHtml`): `TAGE` Mo Kennenlernen (Wortkarten, Abschreiben), Di Silben (Silben schwingen, Silbenkönige), Mi Knifflige Stellen (Stelle, Regenbogen; ohne Stellen → Baukasten), Do Aus dem Kopf (Blitzlesen, Merk-Diktat), Fr Mini-Diktat. `tagIndexHeute()`: am Diktattag immer Fr, am Wochenende keine Tagesaufgabe. Stempel je Kalendertag der laufenden Woche aus `stand.plan[datum].fertig`.
    - *Tagesplan* `S.plan = { datum, tag, liste, idx }`: `planStart()` → `planSchritt()` (Wortkarten, Station oder Diktat) → Endbildschirm zeigt `planKnopf()` → `planWeiter()`. Eine Station ohne Wörter (z. B. Merk-Diktat, wenn Blitzlesen heute schon alle Wörter richtig hatte) wird übersprungen. `startStation()` gibt zurück, ob sie gestartet ist. „Zum Start“ beendet den Plan.
    - *Mini-Diktat* (`startDiktat`, `viewDiktat`): spricht „Wort. Satz. Wort.“, das Kind schreibt alle Wörter, dann Selbstkontrolle Wort für Wort (das Geschriebene wird aus den gespeicherten Strichen neu gemalt, `malVersuch()`), dann `diktatFertig()`: jedes Wort durch `bewerte()`, Schreibversuche nach IndexedDB, Pokal 0 Fehler Gold / 1–2 Silber / sonst Bronze (5/4/3 Sterne), Eintrag in `D.diktate`, `woche.diktatFehler` und `uebertrageFehler()` in die Folgewoche.
    - *Fehlerwörter*: `woche.fehlerwoerter` (aus dem Diktat der Vorwoche) werden in `wochenWoerter()` mitgeübt, auf dem Start gestrichelt. Eine neue Woche übernimmt beim Anlegen die offenen Fehler der Vorwoche; ist die Folgewoche schon da, bekommt sie sie beim Diktat. Im Wochen-Editor einzeln entfernbar.
    - *Eltern-Reiter Fortschritt* (`viewFortschritt`): Wörter der Woche mit Fach, richtig/falsch (nur aus dem Kopf), nächstem Termin und gelb schattierten Fehlerstellen (`fehlerHtml`); Diktate mit Pokal und Fehlern; Sterne und Tagesaufgaben der letzten 7 Tage.
    - *Eltern-Reiter Durchsicht* (`viewDurchsicht`): die gespeicherten Versuche (je Wort 3) neu gemalt, „richtig“/„falsch“ überstimmt die Selbstkontrolle (`urteilen()`): speichert `eltern` am Versuch; bei Blitzlesen, Merk-Diktat und Diktat auch Karteikasten (falsch → Fach 1; richtig nach falscher Selbstkontrolle → `bewerte(true)`), beim Diktat auch Diktat-Ergebnis und Fehlerwörter der Folgewoche.
    **Belohnung (M5)**, Abschnitt *rewards*:
    - *Sticker*: `STICKER` je Thema 8 Inline-SVGs (Einhörner, Halloween, Tiere). Pro geschaffter Tagesaufgabe einer (`neuerSticker()`, erst das eigene Thema, dann die anderen), einmal pro Tag (`stand.plan[datum].sticker`), erscheint als Stempel auf dem Wochenweg und im Album.
    - *Begleiter*: `BEGLEITER` (Fuchs, Einhorn, Gespenst nach Thema), wächst mit den Sternen (`STUFEN` 0/40/120/250/450) und bekommt je Stufe ein Zubehör (`ZUBEHOER`: Halstuch, Blume, Glitzer, Krone; `versatz` je Begleiter, wo nötig). Nur positiv: Sprechblase mit Lob, „gewachsen“ oder Pausenvorschlag.
    - *Sterneglas*: `glasSvg()`, 50 Sterne je Glas, volle Gläser stehen im Pokalregal.
    - *Abzeichen*: `ABZEICHEN` mit Bild, Name, Bedingung über `stand.zaehler` (je gelöstes Wort pro Station, `kopf` = richtig aus dem Kopf, `regenbogen3`, `diktat`, `gold`) oder Karteikasten/Wochenweg. `pruefeAbzeichen()` am Ende jeder Station und jedes Tagesplans.
    - *Tagesziel*: 3 Aufgaben oder 10 Minuten (`stand.heute`), Punkte oben auf dem Start. *Pause*: einmal je Sitzung nach 20 Minuten (Sitzung beginnt neu nach 5 Minuten im Hintergrund).
    - *Ablauf*: `stationsStart()` beim Start, `stationAbschluss()` genau einmal am Ende (Tagesziel, Abzeichen, Pause, Wachstum), `belohnungHtml()` auf jedem Endbildschirm (Stationen, Mini-Diktat), `feiern()` danach mit Ton, Konfetti (`konfetti()` aus Voc a Bit) und vorgelesenem Lob.
    - *Album* (`viewAlbum`): Begleiter, Sterneglas, Stickerseiten je Thema, Pokalregal, Abzeichenwand. Erreichbar über den Begleiter oder das Sterneglas oben auf dem Start.
    **Feinschliff (M6)**: Elternbereich-Reiter *Hilfe* (`viewHilfe`: Installieren, Update, Ton, Stift, Bildschirmzeit, neue Woche), *Sicherung* zeigt die letzte Sicherung (`stand.letzteSicherung`); `sicherungsText()` getrennt von `sicherungSpeichern()`, damit sie ohne Teilen-Menü prüfbar ist. Schreibversuche (IndexedDB) sind bewusst nicht in der Sicherung.
    **Angleichung an die Schule (0.8, Schulmaterial vom 14.10., Fotos lokal in `entwurf/schule-2026-10/`)**:
    - Begriffe wie im Heft: **Königsbuchstaben** (gelb markiert, Krone wie auf der Anlauttabelle; Station `koenige`) und **Stolperstellen** (rot angemalt; Station `stelle`). Die Begriffe „Silbenkönige“ und „knifflige Stelle“ nicht mehr verwenden. Fehlerstellen in Fortschritt und Wort-Editor ebenfalls rot.
    - Wochenweg nach dem Wochenblatt: Mo Abschreiben (Wortkarten, Abschreiben), Di Silbenbögen (Silben schwingen, Blitzlesen), Mi Königsbuchstaben (+ Blitzlesen), Do Stolperstellen (+ Merk-Diktat), Fr Diktat.
    - Lineatur wie auf dem Wochenblatt (`zeichneLineatur()`): hellgraues Mittelband #E4E8F1 und das Häuschen am Zeilenanfang (Dach = Oberband, Wohnung mit zwei Fenstern = Mittelband, Keller mit Treppe = Unterband). Schreibfläche und gemalte Versuche nutzen dieselbe Funktion; die Vorlage beginnt nach dem Häuschen (`hausEnde()`), bei Linkshändern rechts.
    - **Schul-Diktat** (`viewSchulDiktat`, `schulDiktatSpeichern`): Eltern tippen nach dem echten Diktat die falschen Wörter an. Beim ersten Speichern zählt jedes Wort im Karteikasten (falsch → Fach 1, richtig → `bewerte(true)`); spätere Korrekturen ändern nur die Fehlerwörter. `woche.schulDiktat = { datum, falsch }`, Eintrag in `D.diktate` mit `quelle: 'schule'`, Fehler → `diktatFehler` → Folgewoche.
    - Schulwochen haben 15 Wörter.
13. **render / actions / events** – `render()` → `#app.innerHTML`, danach hängt es das langlebige Pad (`aktuellesPad()`) wieder in `[data-pad-host]` ein, Striche bleiben erhalten; der Wort-Editor rendert beim Tippen nur `#wedit-teil` neu (Fokus bleibt). Ereignisse über `data-act` (Klick, Tabelle `ACT`), `data-in` (`IN`), `data-ch` (`CH`).

`?debug` setzt `window.sf` (Zustand und Wortfunktionen) für lokale Prüfungen.

## Neue Wochen aus Fotos (Arbeitsablauf für Claude Code)

Thomas schickt Fotos der Wochenblätter (oft zwei Fotos je Woche: Wörter 1–7 und 8–15). Daraus:
1. `wochen/<id>.json` im Import-Format anlegen: `{ "titel", "woerter": [{ wort, artikel, wortart, art, silben, stellen: [{ zeichen, typ, tipp }], satz }] }`. Wörter genau wie auf dem Blatt; Nomen mit Artikel, wie sie im Diktat geschrieben werden. Stolperstellen nach FRESCH, echte Fehler aus Schul-Diktaten als eigene Stolperstelle mit passendem Tipp. Sätze höchstens 8 Wörter, ohne Namen.
2. Eintrag in `wochen/index.json`: `{ id, titel, datei, rev: 1, hinweis, diktat? (JJJJ-MM-TT, wenn bekannt), schulDiktatFalsch? (Wörter, wenn das Schul-Diktat schon geschrieben ist) }`.
3. Korrektur oder Ergänzung einer schon übernommenen Woche: Datei ändern, `rev` hochzählen. Die App bietet „Aktualisieren“ an; gleiche Wörter behalten ihre Id und den Lernstand.
4. `tools/check.sh` (prüft Silben, Stellen, Schul-Diktat-Wörter), committen, pushen. Thomas: Elternbereich → Wochen → „Übernehmen“ → Diktattermin prüfen → Speichern.

In der App: `holeAngebot()` lädt beim Öffnen des Reiters „Wochen“ `wochen/index.json` (`cache: 'no-store'`), zeigt Wochen mit höherem `rev` als `D.geladen[id]`; `uebernehmen()` öffnet den Wochen-Editor (bei schon übernommener Woche mit deren Id, Termin und Fehlerwörtern). `speichereEntwurf()` merkt `D.geladen[id] = rev`, `woche.quelle = id` und trägt `schulDiktatFalsch` über `schulDiktatAnwenden()` ein.

## Datenmodell

- **Profile** `localStorage['lernwoerter.profile.v1']`: `{ aktiv, liste: [{ id, name, lefty, schrift: grund|andika, thema: einhorn|halloween|tiere, band }] }`.
- **Daten je Kind** `localStorage['lernwoerter.daten.<profil-id>.v1']`: `{ v: 1, woerter: { id: Wort }, wochen: [Woche], diktate: [Diktat], geladen: { wochen-id: rev }, stand: { sterne, tage: { JJJJ-MM-TT: sterne }, w: { wortId: Karte }, rot: { station: index } } }`.
- **Karte** (Lernstand je Wort): `{ fach: 0–5, faellig: "JJJJ-MM-TT", richtig, falsch, zuletzt: "JJJJ-MM-TT", letztes: ok|falsch, fehlerstellen: { "a0".. (Artikel) / "0".. (Wort): anzahl } }`.
- **Wort:** `{ id, wort, artikel, wortart: nomen|verb|adjektiv|andere, art: mitsprech|nachdenk|merk, silben: ["A","bend"], stellen: [{ von, bis, typ, tipp }], satz }`. Ids sind fest, der Lernstand hängt daran. Gleiches Wort (Artikel + Wort, ohne Groß/klein) behält beim Speichern einer Woche seine Id.
- **Woche:** `{ id, titel, diktat: "JJJJ-MM-TT", woerter: [ids], fehlerwoerter: [ids aus dem Vorwochen-Diktat], diktatFehler: [ids], angelegt }`.
- **Diktat** (`D.diktate[]`): `{ id, woche, datum, ergebnis: [{ wort, ok, fehler }], pokal: gold|silber|bronze }`.
- **Tagesplan** (`stand.plan`): `{ JJJJ-MM-TT: { erledigt: [stationen], fertig, sticker } }`.
- **Belohnung** (im `stand`): `zaehler: { station: anzahl }`, `abzeichen: { id: datum }`, `sticker: { id: datum }`, `heute: { datum, aufgaben, minuten, erreicht }`.
- **Sicherung:** `{ app: "lernwoerter", v: 1, exported, profile, daten: { profil-id: Daten } }`, Dateiname `schreibfuchs-sicherung-JJJJ-MM-TT.json`.

## Sterne

Silben schwingen und Silbenkönige: 1 je Wort. Knobel-Stationen: 2 / 1 / 0 (siehe oben). Mini-Diktat: Gold 5, Silber 4, Bronze 3. Abschreiben, Blitzlesen, Merk-Diktat: 2 je Wort, **unabhängig davon, ob die Selbstkontrolle richtig oder falsch ergab**, damit sich Schummeln bei der Selbstkontrolle nicht lohnt. Regenbogen: Durchschnitt der drei Durchgänge (1–3).

## Elternbereich

Einstellungen enthalten die Linienhöhe (28–72 px) mit einer Probe-Schreibfläche. Zugang nur über eine Rechenaufgabe: zweistellig × einstellig mit Ergebnis über 100 (`neueAufgabe()`), Eingabe über Ziffernfeld, falsche Antwort → neue Aufgabe. 7 × 8 o. ä. reicht nicht, das Einmaleins lernt man in NRW in Klasse 2.

## Schrift und Lineatur

- Lineatur wie auf dem Arbeitsblatt der Schule gemessen: vier Linien, drei gleich hohe Bänder, Grundlinie fett, kein farbiges Mittelband (abschaltbar vorhanden). Standard-Bandhöhe `STANDARD_BAND = 56` (am iPad gewählt), passt mit Selbstkontrolle ohne Scrollen ins Querformat (1180 × 788).
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

In der App liefert `bewerteSpur` zusätzlich `ok` (seit 0.10): Genauigkeit ≥ 0,5, Abdeckung ≥ 0,6, schwächster Buchstabe ≥ 0,3 (Abdeckung je Buchstabenkasten, Toleranz 0,2 Band) und Oberlängen-Jaccard ≥ 0,35. Nur ein Durchgang mit `ok` zählt im Regenbogen. Beim freien Schreiben prüft `laengePasst(pad, text)` nur die Breite (0,6–2,2 der Wortbreite); unplausibles „Alles richtig“ → zweiter Blick → Versuch `auffaellig`, Karteikasten erst nach dem Elternurteil in der Durchsicht (`urteilen`). Gleich geformte Wörter erkennt das alles nicht.

## Lokal testen

Direkt aus `~/Downloads` liefert der Vorschau-Server 404. Darum spiegeln:

```bash
rsync -a --delete --exclude entwurf --exclude .git --exclude .claude ~/Downloads/lernwoerter/ /tmp/claude-501/lernwoerter-mirror/
```

Dann in Claude Code `preview_start` mit dem Namen `lernwoerter` (Port 8794, Eintrag in `~/Downloads/.claude/launch.json`). `*.local.*` nicht mitspiegeln. Der Service Worker läuft unter https immer, lokal nur mit `?sw` (Offline-Prüfung: laden, Cache prüfen, Server stoppen, neu laden; danach Service Worker abmelden und Cache löschen, sonst liefert die Vorschau alte Dateien). Ist die Vorschau ausgeblendet, läuft `requestAnimationFrame` nicht: Werte dann synchron abfragen. Testdaten danach aus dem localStorage der Vorschau löschen.

## Git

Repo `daddytomsen/lernwoerter` (öffentlich), Pages aus `main`. Größere Meilensteine auf einem eigenen Zweig (`m1` …), solange auf `main` ein Test von Thomas läuft. `git commit` und `gh` außerhalb der Sandbox (Schlüsselbund, Zertifikate). Commits mit den Attributionszeilen aus dem System-Hinweis.
