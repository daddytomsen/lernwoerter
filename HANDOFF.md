# Übergabe an Claude Code – Schreibfuchs

Stand: 14.10.2026 · Werkstatt-Test M0.2 · Projektordner `~/Downloads/lernwoerter` · geplant unter https://daddytomsen.github.io/lernwoerter/

Lies zuerst `CLAUDE.md` (Aufbau, Regeln) und `KONZEPT.md` (Auftrag). Diese Datei sagt, was entschieden, was fertig und was als Nächstes zu tun ist.

## Entscheidungen (Thomas, 14.10.2026)

| # | Frage (KONZEPT 11) | Entscheidung |
|---|---|---|
| 1 | Für wen? | Nur die Familie. Profile für Geschwister vorsehen, Namen nur im Gerät. |
| 2 | Schrift | NRW. Druckschrift. Im Test: **Playwrite DE Grund** (passt zur Lineatur) gegen Andika. Der M0-Test entscheidet. |
| 3 | Plattform | Web-App wie Voc a Bit. |
| 4 | Kontrolle beim freien Schreiben | Selbstkontrolle plus Eltern-Durchsicht. Scribble wird in M0 nur gemessen. |
| 5 | Name | **Schreibfuchs** (keine gleichnamige Lern-App gefunden, keine Markenrecherche). |
| 6 | Belohnungsthemen | **Einhörner, Halloween, Tiere**, Auswahl beim ersten Start. Halloween kindgerecht (freundliches Gespenst, Kürbis, Fledermaus, kein Grusel). |
| 7 | Lineatur | Wie das Arbeitsblatt: vier Linien, drei gleich hohe Bänder, Grundlinie fett, kein farbiges Mittelband (abschaltbar). Bandhöhe einstellbar. |
| 8 | Repo | Öffentlich, `daddytomsen/lernwoerter`, GitHub Pages, gleiche Regeln wie Voc a Bit. |
| 9 | Gerät | iPad Air M1 (5. Generation) mit Eingabestift eines Drittherstellers (Amazon ASIN B0DC44B473, „Stift für iPad Pro Air Mini 2018–2026“, laut Händler kompatibel mit iPad Air 3.–6. Gen). |
| 10 | Arbeitsblatt | „Lernwörter 1“: der Abend, acht, alle, alt, die Ampel, antworten, der Apfel, der April, arbeiten, der Arm. Foto lokal in `entwurf/`. |

### Notizen von Thomas (14.10.2026, aus dem Bericht)

- **Das Kind ist Linkshänderin.** Linkshänder-Modus ist Standard (Vorlage rechts). Für M2 wichtig: Die linke Hand liegt beim Schreiben auf dem schon Geschriebenen, also Handballen-Sperre und Selbstkontrolle-Anzeige so legen, dass die Hand nichts verdeckt.
- **Das Kind wird mit Namen angesprochen** (Lob, Begrüßung, Vorlesen). Der Name wird im Elternbereich ins Profil eingetragen und liegt nur im Gerät. Er steht nie im Repo, nicht im Code und nicht in diesen Dateien.
- **Elternbereich nur über eine Rechenaufgabe, die ein Kind in Klasse 2 nicht lösen kann.** Das 7 × 8 aus dem Konzept reicht nicht: In NRW lernen Kinder das kleine Einmaleins in Klasse 2. Plan für M1: zufällig zweistellig × einstellig mit Ergebnis über 100 (z. B. 17 × 6), Antwort als Zahl eintippen, neue Aufgabe bei jedem Versuch.
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
2. `tools/check.sh`, `git init -b main`, erster Commit.
3. Thomas legt Repo und Pages an:
   ```bash
   gh repo create lernwoerter --public --source . --push
   gh api -X POST repos/daddytomsen/lernwoerter/pages -f "source[branch]=main" -f "source[path]=/"
   ```
4. Test auf dem iPad (Thomas, mit Kind), Checkliste:
   1. `https://daddytomsen.github.io/lernwoerter/` in Safari öffnen → Teilen → „Zum Home-Bildschirm“ → über das Icon starten.
   2. **Stift:** mit Stift schreiben, dann mit Finger. Hand beim Schreiben ablegen: entstehen Striche durch die Hand? Fühlt sich der Strich verzögert an?
   3. **Schreiben:** Band so einstellen, dass es wie im Heft wirkt. Beide Schriften ansehen: Welche sieht aus wie in der Schule? Einmal mit Linkshänder-Schalter.
   4. **Nachspuren:** drei Wörter sauber, eins absichtlich schlampig, eins gekritzelt. Passen die Sterne zum Gefühl?
   5. **Scribble:** Einstellungen → Apple Pencil → Scribble („Kritzeln“) an, dann die falschen Wörter mit dem Stift in beide Spalten schreiben.
   6. **Bericht:** „Stimme testen“, dann „Bericht kopieren“ und in Claude einfügen.
5. Ergebnisse unten ins Testprotokoll, dann Entscheidung: Schrift, Standard-Band, Sterne-Schwellen, Scribble ja/nein (Konzept 5, Stufe 4).

### Danach: M1 Grundgerüst (KONZEPT 12)

Projekt, Profile, Elternbereich, manuelle Eingabe, Claude-Import (Anleitung für das Arbeitsblatt-Foto), Wortkarte mit Sprachausgabe, Silben, Silbenkönige. Service Worker mit Versionsnummer an zwei Stellen wie in Voc a Bit. Die Schriftdateien müssen im Cache-Kern stehen.

## Nicht ohne Rückfrage

- Kein Server, keine Konten, kein Tracking, keine Werbung, keine Push-Nachrichten.
- Kein Framework, kein Build-Schritt.
- Keine Kosten auslösen (Apple-Entwicklerprogramm, bezahlte Dienste).
- Pädagogische Grundlage (KONZEPT 2) nicht verwässern.
- Voc a Bit in `~/Downloads/wordbox` nicht verändern.

## Testprotokoll

| Datum | Gerät / iPadOS | Ergebnis |
|---|---|---|
| | | |
