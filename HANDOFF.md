# Übergabe an Claude Code – Schreibfuchs

Stand: 14.10.2026 · **App 0.8 live** (an die Schule angeglichen) auf `main` (M1–M6 zusammengeführt am 14.10. auf Wunsch von Thomas, vor dem M0-Test) · Werkstatt-Test unter `/werkstatt.html` · Projektordner `~/Downloads/lernwoerter` · live unter https://daddytomsen.github.io/lernwoerter/

Lies zuerst `CLAUDE.md` (Aufbau, Regeln) und `KONZEPT.md` (Auftrag). Diese Datei sagt, was entschieden, was fertig und was als Nächstes zu tun ist.

## Entscheidungen (Thomas, 14.10.2026)

| # | Frage (KONZEPT 11) | Entscheidung |
|---|---|---|
| 1 | Für wen? | Nur die Familie. Profile für Geschwister vorsehen, Namen nur im Gerät. |
| 2 | Schrift | NRW. **Playwrite DE Grund** (im M0-Test am iPad bestätigt, 14.10.). Andika bleibt in den Einstellungen wählbar. |
| 3 | Plattform | Web-App wie Voc a Bit. |
| 4 | Kontrolle beim freien Schreiben | Selbstkontrolle plus Eltern-Durchsicht. **Scribble verworfen** (M0-Test 14.10.: liest die Handschrift falsch, „Hunt“→„Unt“, „Fogel“→„Focuel“, „Abent“→„Abert“). Eine native Hülle mit Apples Texterkennung (KONZEPT 10, Phase 2) nur bei echtem Bedarf. |
| 5 | Name | **Schreibfuchs** (keine gleichnamige Lern-App gefunden, keine Markenrecherche). |
| 6 | Belohnungsthemen | **Einhörner, Halloween, Tiere**, Auswahl beim ersten Start. Halloween kindgerecht (freundliches Gespenst, Kürbis, Fledermaus, kein Grusel). |
| 7 | Lineatur | Wie das Arbeitsblatt: vier Linien, drei gleich hohe Bänder, Grundlinie fett, kein farbiges Mittelband (abschaltbar). **Standard-Bandhöhe 56 px** (am iPad gewählt, `STANDARD_BAND`), je Kind einstellbar. |
| 8 | Repo | Öffentlich, `daddytomsen/lernwoerter`, GitHub Pages, gleiche Regeln wie Voc a Bit. |
| 9 | Gerät | iPad Air M1 (5. Generation) mit Eingabestift eines Drittherstellers (Amazon ASIN B0DC44B473, „Stift für iPad Pro Air Mini 2018–2026“, laut Händler kompatibel mit iPad Air 3.–6. Gen). |
| 10 | Arbeitsblatt | „Lernwörter 1“: der Abend, acht, alle, alt, die Ampel, antworten, der Apfel, der April, arbeiten, der Arm. Foto lokal in `entwurf/`. |

### Notizen von Thomas (14.10.2026, aus dem Bericht)

- **Das Kind ist Linkshänderin.** Linkshänder-Modus ist Standard (Vorlage rechts). Für M2 wichtig: Die linke Hand liegt beim Schreiben auf dem schon Geschriebenen, also Handballen-Sperre und Selbstkontrolle-Anzeige so legen, dass die Hand nichts verdeckt.
- **Das Kind wird mit Namen angesprochen** (Lob, Begrüßung, Vorlesen). Der Name wird im Elternbereich ins Profil eingetragen und liegt nur im Gerät. Er steht nie im Repo, nicht im Code und nicht in diesen Dateien.
- **Elternbereich nur über eine Rechenaufgabe, die ein Kind in Klasse 2 nicht lösen kann.** Das 7 × 8 aus dem Konzept reicht nicht: In NRW lernen Kinder das kleine Einmaleins in Klasse 2. Umgesetzt in M1: zufällig zweistellig × einstellig mit Ergebnis über 100 (z. B. 17 × 6), Antwort als Zahl eintippen, neue Aufgabe bei jedem Versuch.
- Stifttest auf dem iPad folgt am Abend des 14.10.

### Was daraus folgt

- **Stift:** Das Modell passt laut Händler zum iPad Air M1. Dritthersteller-Stifte dieser Art melden sich wie ein Apple Pencil, haben Neigung und Handballen-Erkennung, aber meist **keinen Druck**. Ob Scribble mit ihm geht, ist offen. Der Reiter „Stift“ misst beides. Die App funktioniert auch ohne Druck (feste Strichbreite).
- **Wortlisten:** Die Liste ist alphabetisch und hat Artikel. Das spricht für den NRW-Grundwortschatz (533 Wörter: 422 Nachdenkwörter, 111 Merkwörter; Quelle Schulministerium NRW, Portal grundwortschatz.nrw.de). Die Schule arbeitet ihn wohl der Reihe nach ab, nicht nach Rechtschreibthema. Die NRW-Einteilung kennt kein eigenes „Mitsprechwort“, das steckt bei den Nachdenkwörtern. Für M1 klären: Lizenz der Liste. Erst dann ließe sie sich einbetten (Konzept 8: amtliche Listen nicht ungeprüft).

## Fertig

- Projektordner mit `CLAUDE.md`, `README.md`, `.gitignore`, `robots.txt`, `.nojekyll`, `tools/check.sh`, Schriften mit OFL-Lizenztexten.
- Werkstatt-Test `index.html` (M0.1), lokal im Browser geprüft:
  1. **Stift:** freie Fläche, Live-Anzeige von Eingabeart, Druck, Neigung, Kontaktfläche, Abtastrate, Zwischenpunkten, Verarbeitungszeit, ignorierten Handballen. Knopf „Finger wieder erlauben“.
  2. **Schreiben:** Lineatur mit Vorlage links (Linkshänder: rechts), Schrift, Band, Wort und farbiges Mittelband einstellbar, Vorlesen, Statistik zu gespeicherten Punkten.
  3. **Nachspuren:** graue Vorlage, Bewertung mit Genauigkeit und Abdeckung, Sterne, Überlagerung der Bewertung, Regenbogenfarben je Versuch. Mit `?debug` vier synthetische Testspuren.
  4. **Scribble:** sieben absichtlich falsche Wörter, je ein Feld ohne und mit Autokorrektur, Ergebnis „wie geschrieben“ oder „verändert“.
  5. **Bericht:** alle Messwerte als Text zum Kopieren, Stimmentest Deutsch, Notizfeld.
- Synthetische Bewertung: genau 100/100, leicht zittrig 91/98, stark zittrig 73/92, daneben 48/53, Gekritzel 48/62 (Genauigkeit/Abdeckung in %, Band 40, Toleranz 0,15 Band).

**Nicht auf dem iPad getestet.** Alles oben ist nur am Mac im Browser geprüft.

## Aufgaben

### M0 abschließen

1. ~~`sterneFuerSpur()` festlegen~~ erledigt: der schwächere der beiden Werte zählt, ab 0,85 drei Sterne, ab 0,65 zwei, sonst einer. Mit echten iPad-Werten nachjustieren.
2. ~~Erster Commit~~ erledigt 14.10. (`ecbb3be`).
3. ~~Repo und Pages~~ erledigt 14.10.: https://github.com/daddytomsen/lernwoerter (öffentlich), Pages aus `main` / Wurzel. Angelegt von Claude Code mit `gh` außerhalb der Sandbox (im Sandbox-Lauf scheitert `gh` am Schlüsselbund und an der Zertifikatsprüfung).
4. Test auf dem iPad (Thomas, mit Kind), Checkliste:
   1. `https://daddytomsen.github.io/lernwoerter/werkstatt.html` in Safari öffnen (seit 14.10. liegt unter der Hauptadresse die App).
   2. **Stift:** mit Stift schreiben, dann mit Finger. Hand beim Schreiben ablegen: entstehen Striche durch die Hand? Fühlt sich der Strich verzögert an?
   3. **Schreiben:** Band so einstellen, dass es wie im Heft wirkt. Beide Schriften ansehen: Welche sieht aus wie in der Schule? Einmal mit Linkshänder-Schalter.
   4. **Nachspuren:** drei Wörter sauber, eins absichtlich schlampig, eins gekritzelt. Passen die Sterne zum Gefühl?
   5. **Scribble:** Einstellungen → Apple Pencil → Scribble („Kritzeln“) an, dann die falschen Wörter mit dem Stift in beide Spalten schreiben.
   6. **Bericht:** „Stimme testen“, dann „Bericht kopieren“ und in Claude einfügen.
5. ~~Ergebnisse ins Testprotokoll, Entscheidungen~~ erledigt 14.10. (Bericht 16:33): Schrift Playwrite DE Grund, Band 56, Sterne-Schwellen bestätigt, Scribble verworfen. Umgesetzt als 0.7. Handballen geklärt (Thomas, 14.10.): Hand lag beim Test auf, 0 Berührungen kamen an. iPadOS filtert die Handfläche bei diesem Stift selbst, die Sperre der App ist nur zweite Absicherung.

### M1 Grundgerüst (KONZEPT 12) – auf Zweig `m1`, lokal geprüft, nicht auf dem iPad

Fertig, wenn eine Woche sich anlegen und ansehen lässt: erfüllt (Mac-Browser, Quer- und Hochformat).

- Werkstatt-Test liegt jetzt in `werkstatt.html` (im Elternbereich unter Einstellungen verlinkt), `index.html` ist die App 0.1.
- **Erster Start:** Eltern tragen Name und „schreibt mit links“ ein, dann wählt das Kind sein Thema (Einhörner, Halloween, Tiere). Das Thema färbt die App. Weitere Kinder im Elternbereich, Auswahl „Wer übt jetzt?“ auf dem Start.
- **Elternbereich** hinter der Rechenaufgabe: Wochen (Liste, neu mit Foto, neu von Hand, bearbeiten, löschen mit Rückfrage), Einstellungen (Name, links, Schrift, Thema, Kinder, Link zum Werkstatt-Test), Sicherung (speichern über Teilen-Menü, laden aus Datei).
- **Foto-Import:** Anleitung kopieren → in der Claude-App mit Foto senden → Antwort einfügen → Vorschau aller Wörter → prüfen, Diktattermin (Standard: nächster Freitag), speichern. Mit einer Beispielantwort zum Arbeitsblatt geprüft (10 Wörter, zweites „t“ über `nr`, unbekannte Stelle verworfen).
- **Wort-Editor:** „der Abend“ eintippen → Vorschläge für Wortart, FRESCH-Art, Silben, Stellen. Silbengrenzen durch Tippen zwischen die Buchstaben, Stellen durch Antippen der Buchstaben und Typ wählen, Tipp-Text und Beispielsatz änderbar.
- **Kind:** Start mit Begrüßung, Woche mit Diktat-Countdown und Wortchips (unterstrichen in Wortart-Farbe), drei Kacheln. Wortkarte: Wort in Schulschrift, Artikel grau, Wortart-Streifen, Vorlesen von Wort und Satz, Silbenbögen (spricht die Silben langsam), Silbenkönige mit Krone. Station „Silben schwingen“ (Trommel, nach zwei Fehlversuchen Hilfe ohne Stern). Station „Silbenkönige“ (Selbstlaute antippen, Mitlaute wackeln nur). Je gelöstes Wort ein Stern, Ende mit „Geschafft!“.
- Service Worker und Manifest, Version an zwei Stellen, `tools/check.sh` erweitert.

Offen für M1 auf dem iPad: Ersteinrichtung, Import mit echtem Foto in der Claude-App, Vorlesen (deutsche Stimme), Sicherung über das Teilen-Menü, Offline-Start.

**Zusammenführen:** Nach Thomas' M0-Test (Abend 14.10.) Erkenntnisse übernehmen, dann `m1` nach `main` und pushen. Danach in der Release-Nachricht: App einmal komplett schließen, zweimal öffnen. Die Adresse bleibt gleich, der Werkstatt-Test ist dann unter `/werkstatt.html`.

### M2 Schreibstationen – auf Zweig `m2` (baut auf `m1` auf), lokal geprüft, nicht auf dem iPad

Fertig, wenn ein Wort nach richtigem Schreiben aus dem Gedächtnis am nächsten Tag ein Fach weiter wandert: erfüllt (Mac-Browser, Tag per `sf.tag(1)` verschoben). Heute richtig → Fach 2, fällig morgen, heute nicht mehr in der Runde; morgen zuerst die fälligen Wörter, richtig → Fach 3; ein zweites Mal am selben Tag → bleibt in Fach 3. Falsch → Fach 1, kommt heute noch einmal.

- **Abschreiben:** Vorlage auf der Lineatur (Linkshänderin: rechts), schreiben, Selbstkontrolle. Bewegt keine Karteikarte, notiert aber Fehlerstellen.
- **Regenbogen:** graues Wort dreimal nachfahren (Rot, Grün, Blau), jeder Durchgang einzeln bewertet. Sauber 3/3/3 → 3 Sterne, Zickzack → 1 Stern.
- **Blitzlesen:** Wort blitzt 1,2–2,5 s auf (bis zu dreimal, solange noch nichts geschrieben ist), dann aus dem Kopf schreiben, Selbstkontrolle, Karteikasten.
- **Merk-Diktat:** Wort anschauen, „Ich hab es!“, der Fuchs läuft 2,6 s, dann aus dem Kopf schreiben, Selbstkontrolle, Karteikasten.
- **Selbstkontrolle:** Das richtige Wort erscheint Buchstabe für Buchstabe über der eigenen Schrift. „Alles richtig“ oder falsche Buchstaben antippen (gelb) und „Fertig verglichen“. Nach Fehlern schreibt das Kind das Wort einmal mit Vorlage richtig ab. Fehlerstellen werden je Wort gezählt (Artikel getrennt).
- **Karteikasten** auf dem Startbildschirm (neu, Fach 1–5 für die Wörter der Woche).
- **Schreibversuche** in IndexedDB, je Wort die letzten 3 (für die Durchsicht durch die Eltern in M4).
- **Linienhöhe** in den Einstellungen mit Probe-Schreibfläche.
- Runden mit 5 Wörtern, am Ende „Noch eine Runde“. Sterne siehe CLAUDE.md.

Offen auf dem iPad: Schreiben mit Stift und Finger in der App, Handballen beim Linksschreiben, Blitzdauer, Lesbarkeit der grauen Spur, Linienhöhe.

**Reihenfolge beim Zusammenführen:** nach dem M0-Test `m2` (enthält `m1`) nach `main`. Erkenntnisse aus dem Test (Schrift, Band, Sterne-Schwellen) vorher in `index.html` und `werkstatt.html` übernehmen.

### M3 Automatische Übungen – auf Zweig `m3` (enthält `m2`), lokal geprüft, nicht auf dem iPad

Fertig, wenn alle drei FRESCH-Kategorien passende Übungen haben: erfüllt.

| FRESCH | Übungen |
|---|---|
| Mitsprechwort | Silben schwingen, Silbenkönige, Baukasten |
| Nachdenkwort | Lückenwort (verlängern, ableiten, ie, ck, tz, Doppelmitlaut), Knifflige Stelle, Baukasten mit passenden Ablenkern |
| Merkwort | Blitzlesen, Merk-Diktat, Knifflige Stelle, Lückenwort für v/f, ß, Dehnungs-h, Doppelselbstlaut |

- Vier neue Stationen: **Baukasten**, **Lückenwort**, **Wortarten** (Kisten Nomen blau, Verb rot, Adjektiv grün, danach der/die/das), **Knifflige Stelle** (Textmarker). Alle automatisch geprüft, sanfte Hilfen statt Fehlerton.
- Startbildschirm in vier Gruppen: Anschauen und Silben, Knobeln, Schreiben, Aus dem Kopf. Stationen ohne passende Wörter in der Woche werden ausgeblendet.
- Wortkarte zeigt die FRESCH-Art mit Strategie („Merkwort: genau merken“), antippen liest sie vor.
- Geprüft mit einer Testwoche aus Arbeitsblatt-Wörtern plus Hund, Tiere, spielen, Zucker, Katze, fahren, Vogel. Gefundener und behobener Fehler: doppelte Ablenker wurden zu einem zusammengelegt (Hund hatte nur „t“).

Offen auf dem iPad: Größe der Bausteine und Kisten für Kinderfinger, Startbildschirm scrollt jetzt (wird in M4 mit dem Wochenweg neu geordnet).

**Zusammenführen:** nach dem M0-Test `m3` (enthält `m1` und `m2`) nach `main`.

### M4 Woche und Diktat – auf Zweig `m4` (enthält `m1` bis `m3`), lokal geprüft, nicht auf dem iPad

Fertig, wenn ein kompletter Wochenablauf durchläuft: erfüllt. Durchgespielt mit verschobenem Datum (Mo 12.10. bis Sa 17.10.) und zwei Testwochen:

| Tag | Tagesaufgabe | Ergebnis |
|---|---|---|
| Mo | Wortkarten → Abschreiben | Stempel |
| Di | Silben schwingen → Silbenkönige | Stempel |
| Mi | Knifflige Stelle → Regenbogen | Stempel |
| Do | Blitzlesen → Merk-Diktat (übersprungen, alle 5 Testwörter schon richtig) | Stempel, alle Wörter Fach 2 |
| Fr | Mini-Diktat, 2 Fehler (Hund, Vogel) | Silber-Pokal, 4 Sterne, richtige → Fach 3, falsche → Fach 1, Stempel |
| Sa | Start zeigt Woche 2 | Hund und Vogel gestrichelt als Fehlerwörter dabei, „Heute ist Wochenende“ |

Danach Elternbereich: Fortschritt zeigt Fächer und Fehlerstellen, Durchsicht zeigt 15 gemalte Versuche (5 Wörter × 3). „Hund“ im Diktat auf „richtig“ gestellt → Fach 2, aus den Fehlerwörtern von Woche 2 entfernt, in IndexedDB vermerkt.

- **Wochenweg** mit fünf Tagen, Stempel je geübtem Tag, großer Knopf für die Aufgabe des Tages („Nochmal“, wenn schon erledigt). Darunter „Freies Üben“ mit allen Stationen.
- **Mini-Diktat:** App spricht Wort, Satz, Wort; „Nochmal hören“; alle Wörter schreiben, dann vergleichen; Pokal in Gold, Silber oder Bronze.
- **Fehlerwörter** gehen automatisch in die nächste Woche, im Wochen-Editor sichtbar und entfernbar.
- **Elternbereich** mit neuen Reitern **Fortschritt** und **Durchsicht** (überstimmt die Selbstkontrolle).

Offen auf dem iPad: Diktat-Sprachausgabe (Satz, Tempo), ob das Kind im Diktat mit „Nochmal hören“ zurechtkommt, Lesbarkeit der gemalten Versuche in der Durchsicht.

**Zusammenführen:** nach dem M0-Test `m4` (enthält `m1` bis `m3`) nach `main`.

### M5 Belohnung – auf Zweig `m5` (enthält `m1` bis `m4`), lokal geprüft, nicht auf dem iPad

Fertig, wenn das Kind nach jeder Station eine Belohnung sieht: erfüllt. Jeder Endbildschirm (alle Stationen und das Mini-Diktat) zeigt Begleiter mit Sprechblase, Sterneglas mit „+n“ und, wenn verdient, neue Sticker, Abzeichen, Tagesziel, Wachstum oder Pausenhinweis, dazu Ton, Konfetti und vorgelesenes Lob.

- **Sticker** (24 Zeichnungen, je 8 Einhörner, Halloween, Tiere) für jede geschaffte Tagesaufgabe, als Stempel auf dem Wochenweg und im **Album**.
- **Begleiter** nach Thema (Einhorn, Gespenst, Fuchs), wächst in fünf Stufen und bekommt Halstuch, Blume, Glitzer, Krone. Oben links auf dem Start, tippen öffnet das Album.
- **Sterneglas** (50 Sterne), volle Gläser im **Pokalregal** neben den Diktat-Pokalen.
- **14 Abzeichen** mit Bildern (Silbentrommler, Silbenkönig, Baumeister, Stellen-Detektiv, Lückenprofi, Wortarten-Profi, Spurenleser, Schönschreiber, Kopf-Schreiber, Karteikasten-Meister, Erstes Diktat, Gold-Diktat, Wochenweg-Held, Fleißig). Noch fehlende stehen grau mit Hinweis im Album.
- **Tagesziel** 3 Aufgaben oder 10 Minuten (drei Punkte oben), **Pausenhinweis** einmal nach 20 Minuten.
- Geprüft: Stand aus 0.4 wird ergänzt; Gespenst wächst bei 40 Sternen; Montag-Tagesaufgabe → Bonbon-Sticker als Stempel; Tagesziel nach der 3. Aufgabe; Pausenhinweis nur einmal; Abzeichen Silbenkönig und Silbentrommler an der Schwelle; alle 24 Sticker und alle Begleiter-Stufen angesehen. Einhorn-Zubehör saß auf dem Horn → eigener Versatz.

Offen auf dem iPad: Freude des Kindes am Begleiter und an den Stickern (Thomas beobachtet), Lautstärke der Töne, ob 20 Minuten als Pausengrenze passen.

**Zusammenführen:** nach dem M0-Test `m5` (enthält `m1` bis `m4`) nach `main`.

### M6 Feinschliff – auf Zweig `m6` (enthält `m1` bis `m5`), lokal geprüft, iPad-Test offen

Fertig, wenn der Test auf dem iPad bestanden und im Testprotokoll ist: **offen, das macht Thomas** (Checkliste unten). Vorbereitet und am Mac geprüft:

- **App-Icon** (Fuchs über Schul-Lineatur mit Stift): `icon.svg` → `apple-touch-icon.png`, `icon-192.png`, `icon-512.png`, randlos, ohne Alphakanal, im Manifest (auch maskable) und im Cache-Kern.
- **Offline:** Service Worker lokal mit `?sw` eingeschaltet, Cache mit allen 9 Kerndateien, Server gestoppt, neu geladen: App startet mit Schulschrift, Werkstatt-Test und Icons. Danach abgemeldet und Cache geleert.
- **Sicherung:** Kreislauf Speichern → alles löschen → Laden für zwei Kinderprofile, Karteikasten, Sterne und Sticker gleich; fremde Datei wird abgelehnt, ohne etwas zu ändern. „Letzte Sicherung“ steht im Reiter Sicherung.
- **Hilfe-Reiter** im Elternbereich: Installieren, Update (zweimal öffnen), Ton und Vorlesen, Stift und Finger, Bildschirmzeit, neue Woche. Dasselbe zur Bildschirmzeit im README.
- **Werkstatt-Test:** Fehler beim Tippen auf einen Reiter vor dem Laden der Schriften behoben.

### Zusammenführen und veröffentlichen – erledigt 14.10.

`main` per Fast-Forward auf `m6` gebracht und gepusht (Thomas: „schalte live“), damit er heute Abend App und Werkstatt-Test zusammen testen kann. Offen bleibt: Erkenntnisse aus dem M0-Bericht (Schrift-Standard, Linienhöhe-Standard, Sterne-Schwellen in `sterneFuerSpur()` in App und Werkstatt, Scribble, Blitzdauer) als kleines Update 0.7 nachziehen. Zweige `m1`–`m6` können bleiben oder auf Wunsch gelöscht werden.

Adressen: App https://daddytomsen.github.io/lernwoerter/ · Werkstatt-Test https://daddytomsen.github.io/lernwoerter/werkstatt.html

### iPad-Checkliste für Thomas (App 0.6, mit dem Kind)

**Einrichten**
1. Bildschirmzeit wie unter Elternbereich → Hilfe (Safari erlaubt, nur diese Website).
2. Adresse öffnen → Zum Home-Bildschirm → über das Fuchs-Icon starten. Icon sieht gut aus?
3. Ersteinrichtung: Name, „schreibt mit links“, Kind wählt Thema.
4. Elternbereich (Rechenaufgabe) → Neue Woche mit Foto: Anleitung kopieren, in der Claude-App mit Foto vom Arbeitsblatt senden, Antwort einfügen. Stimmen Wörter, Silben, Stellen? Diktattermin, speichern.

**Üben (über mehrere Tage)**
5. Wochenweg: „Los geht's“ führt durch die Tagesaufgabe, am Ende Sticker und Stempel.
6. Wortkarte: Vorlesen von Wort und Satz (deutsche Stimme?), Silbenbögen, Silbenkönige.
7. Schreibstationen mit dem Stift: Handballen ignoriert? Strich flüssig? Linienhöhe passend? Vorlage rechts für die Linkshänderin.
8. Selbstkontrolle: Versteht das Kind das Antippen falscher Buchstaben?
9. Knobeln: Bausteine, Lücke, Kisten, Textmarker groß genug für Kinderfinger?
10. Mini-Diktat am Diktattag: Sprechtempo, „Nochmal hören“, Pokal.
11. Belohnung: Freut sich das Kind über Begleiter, Sterneglas, Sticker? Töne zu laut? Pausenhinweis nach 20 Minuten passend?

**Technik**
12. Flugmodus an, App neu starten: läuft sie?
13. Sicherung speichern (Teilen-Menü → In Dateien sichern), Sicherung laden.
14. Nach dem nächsten Update: ganz schließen, zweimal öffnen, Versionsnummer unter Einstellungen prüfen.
15. Elternbereich → Durchsicht: Schreibversuche lesbar? Fortschritt verständlich?

Ergebnisse ins Testprotokoll unten. Fehler und Wünsche an Claude Code.

### 0.8 – Angleichung an die Schule (14.10.2026 abends, Wunsch Thomas)

Aus dem Schulmaterial (Wochenblätter, Anlauttabelle, Diktat, Artikel-Blatt; Fotos lokal in `entwurf/schule-2026-10/`):
- Begriffe **Königsbuchstaben** (gelb) und **Stolperstellen** (rot) wie im Heft, Wochenweg wie das Wochenblatt (Mo Abschreiben, Di Silbenbögen, Mi Königsbuchstaben, Do Stolperstellen, Fr Diktat), Lineatur mit Häuschen und grauem Mittelband.
- **Schul-Diktat** im Elternbereich (Wochen → „Schul-Diktat“): falsche Wörter antippen → Fehlerwörter der nächsten Woche, Karteikasten.
- Drei Wochen als fertige Import-Texte in `~/Downloads/schreibfuchs-transfer/wochen-import.md` (AB 4 mit den drei echten Diktatfehlern als Stolperstellen, „der, die, das“, „hat, haben“ nur 1–7).
- Geprüft im Browser: Import beider Wochen über die Oberfläche, Schul-Diktat AB 4 12/15 → um, lesen, Baum als Fehlerwörter der Folgewoche und Fach 1, Korrektur nimmt „lesen“ wieder heraus; Optik von Häuschen, Königsbuchstaben, Stolperstellen.
- **Offen:** Farben. Artikel-Blatt der Schule: der blau, die rot, das grün. App: Wortarten Nomen blau, Verb rot, Adjektiv grün (aus dem Konzept). Thomas klärt, wie die Schule die Wortarten färbt. Empfehlung bei Unklarheit: Artikel nach Schulblatt färben, Wortarten-Kisten mit Symbolen statt Farben.

## Nicht ohne Rückfrage

- Kein Server, keine Konten, kein Tracking, keine Werbung, keine Push-Nachrichten.
- Kein Framework, kein Build-Schritt.
- Keine Kosten auslösen (Apple-Entwicklerprogramm, bezahlte Dienste).
- Pädagogische Grundlage (KONZEPT 2) nicht verwässern.
- Voc a Bit in `~/Downloads/wordbox` nicht verändern.

## Testprotokoll

| Datum | Gerät / iPadOS | Ergebnis |
|---|---|---|
| 14.10.2026 | iPad Air M1, Dritthersteller-Stift, Home-Bildschirm, Werkstatt-Test M0.2 | Stift als `pen` erkannt (70 Berührungen), Neigung ja, Druck konstant 0,12 (kein Drucksensor, feste Strichbreite greift), Abtastrate ≈ 281 Hz, 3,9 Zwischenpunkte je Bewegung, Verarbeitung 3,8 ms. Nachspuren „alt“: schlampig 43 %/85 % → 1 Stern, sauber 98 %/100 % → 3 Sterne (Schwellen passen). Gewählt: Playwrite DE Grund, Band 56. Scribble liest falsch (Hunt→Unt, Fogel→Focuel, Fahrad→Farad, Abent→Abert, fröhlig→Gröihlig, nur Apel richtig) → verworfen. Deutsche Stimme Anna vorhanden. Handballen: Hand lag auf, 0 Berührungen kamen an (iPadOS filtert selbst). |
