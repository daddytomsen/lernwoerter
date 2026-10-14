# Auftrag: Lernwörter-App für Klasse 2 auf dem iPad

Du bist Claude Code in einer neuen Sitzung. Sprache Deutsch, Du-Form. Dein Gegenüber ist Thomas, Vater, technisch versiert, aber kein Entwickler. Seine Arbeitsweise steht in deiner Memory. Diese Datei ist das Konzept, kein fertiger Plan: Lies sie ganz, kläre die offenen Punkte aus Abschnitt 11 mit Thomas und baue erst dann.

## 0. Erst lesen

1. Lies `~/Downloads/wordbox/CLAUDE.md` und `~/Downloads/wordbox/HANDOFF.md`, überfliege `~/Downloads/wordbox/index.html`. Das ist „Voc a Bit“, eine Englisch-Vokabel-App derselben Familie, die als Vorbild dient: Single-File-Web-App, GitHub Pages, Karteikasten, XP, Lernziele, Import über Claude. Übernimm Muster und Erfahrungen, aber kopiere Code gezielt statt das Projekt zu verzweigen. Die Englisch-App bleibt unangetastet.
2. Stelle Thomas die Fragen aus Abschnitt 11 in **einer** Nachricht, jeweils mit deiner Empfehlung. Wo er nicht antwortet, gilt die Empfehlung.
3. Dann Meilenstein M0 (Spikes) aus Abschnitt 12.

## 1. Ziel

Ein Kind der 2. Klasse übt seine wöchentlichen **Lernwörter** auf dem iPad, mit Apple Pencil oder Finger. Die App folgt dem Lernwörter-Prinzip der Grundschule, macht Spaß, belohnt ohne Druck, läuft offline und braucht keinen Server, kein Konto und kein Tracking. Eltern nehmen die Wörter der Woche per Foto vom Arbeitsblatt auf.

Erfolgsmaß: Das Kind schreibt die Wörter der Woche im Mini-Diktat am Freitag richtig, und Fehlerwörter verschwinden innerhalb von zwei Wochen.

## 2. Pädagogische Grundlage (verbindlich)

Lernwörter sind ein fester Stamm häufiger oder orthografisch schwieriger Wörter (Grundwortschatz), die so lange trainiert werden, bis sie automatisiert richtig geschrieben werden. In Klasse 2 lernen Kinder, dass Gehörtes und Geschriebenes voneinander abweichen.

**Drei Wortarten nach FRESCH**, jede braucht eine andere Übung:

| Kategorie | Kennzeichen | Strategie | Beispiel |
|---|---|---|---|
| Mitsprechwort | schreibt sich, wie man deutlich spricht | Silben schwingen, mitsprechen | Lam-pe |
| Nachdenkwort | Regel anwenden | verlängern, ableiten | Hund, weil Hun-de |
| Merkwort | keine Regel, auswendig | genau anschauen, merken, verdeckt schreiben | Vogel, Fahrrad, ie, stummes h, Doppelvokal |

**Wochenrhythmus**, 7 bis 10 Wörter pro Woche, oft zu einem Rechtschreibthema:

| Tag | Aufgabe | Ziel |
|---|---|---|
| Montag | Einführung, im Satz besprechen, abschreiben | Wort kennen, richtig übertragen |
| Dienstag | Silben klatschen, Silbenkönige markieren | Silbenstruktur, Vokale (a e i o u ä ö ü, au ei eu ie als Einheit) |
| Mittwoch | schwierige Stelle markieren | sp/st am Anfang, tz, ck, ie, Doppelkonsonant, h |
| Donnerstag | verdeckt aus dem Gedächtnis schreiben | Fünf-Fächer-Lernwörterkartei |
| Freitag | Mini-Diktat | Überprüfung, Fehlerwörter wandern in die nächste Woche |

**Übungsformen aus dem Unterricht**, die die App digital abbildet: Regenbogenschreiben (mehrfach farbig nachspuren), Wortarten sortieren (Nomen blau, Verben rot, Adjektive grün), Laufdiktat (merken, Weg gehen, aufschreiben), Blitzlesen (Wort nur kurz zeigen), Partnerdiktat.

Die App ersetzt nicht das Heft, sie ergänzt es. Handschrift bleibt Kern: wo immer geschrieben wird, wird mit Stift oder Finger geschrieben, nicht getippt.

## 3. Kernablauf

1. **Eltern** fotografieren die Lernwörterliste vom Arbeitsblatt und nehmen sie als neue Woche auf, mit Diktattermin.
2. **Kind** öffnet die App, sieht seine Woche als Weg mit Tagesstationen und arbeitet 10 bis 15 Minuten. Die App schlägt die Station des Tages vor, freies Üben ist immer möglich.
3. **Im Hintergrund** läuft der Karteikasten: Jedes Wort, das aus dem Gedächtnis richtig geschrieben wurde, steigt pro Tag ein Fach.
4. **Am Diktattag** diktiert die App per Sprachausgabe. Danach gibt es Pokal oder Sticker, falsch geschriebene Wörter landen automatisch als Fehlerwörter in der nächsten Woche.
5. **Eltern** sehen im geschützten Elternbereich, was geübt wurde, welche Wörter und welche Stellen Probleme machen, und können geschriebene Versuche durchsehen.

## 4. Stationen (Übungen)

| Station | Was das Kind tut | Eingabe | Kontrolle | Passt zu |
|---|---|---|---|---|
| Wortkarte | Wort sehen, hören (Sprachausgabe), Satz hören, Silbenbögen sehen | Tippen | keine | Montag |
| Abschreiben | Wort oben, auf der Lineatur darunter schreiben | Stift/Finger | Selbstkontrolle (siehe 5) | Montag |
| Silben schwingen | pro Silbe einmal auf die Trommel tippen oder Bögen unter das Wort ziehen | Tippen/Ziehen | automatisch: Silbenzahl | Dienstag |
| Silbenkönige | Vokale und Doppellaute antippen, sie färben sich | Tippen | automatisch | Dienstag |
| Schwierige Stelle | die knifflige Stelle antippen, sie leuchtet wie Textmarker | Tippen | automatisch gegen `stellen` | Mittwoch |
| Regenbogenschreiben | Wort dreimal in verschiedenen Farben nachspuren | Stift/Finger | automatisch: geometrische Spur-Bewertung | Mittwoch |
| Buchstaben-Baukasten | Buchstaben in die richtige Reihenfolge legen, mit Ablenkern (d/t, ie/i, einfacher/doppelter Konsonant) | Ziehen/Tippen | automatisch | jeden Tag |
| Lückenwort | „Hun_“: d oder t? mit Verlängerungs-Tipp „Hunde“ | Tippen | automatisch | Nachdenkwörter |
| Wortarten sortieren | Wörter in blaue, rote, grüne Kiste ziehen; bei Nomen den Artikel wählen | Ziehen | automatisch | jeden Tag |
| Blitzlesen | Wort erscheint 1–2 s, dann verdeckt schreiben | Stift/Finger | Selbstkontrolle | Merkwörter, Donnerstag |
| Merk-Diktat (Laufdiktat) | Wort merken, „ich hab’s“, kurze Pause-Animation, dann schreiben | Stift/Finger | Selbstkontrolle | Donnerstag |
| Mini-Diktat | App spricht Wort und Satz, Kind schreibt | Stift/Finger | Selbstkontrolle, Eltern-Durchsicht | Freitag |

Nur Stationen, in denen **aus dem Gedächtnis** geschrieben wird (Blitzlesen, Merk-Diktat, Mini-Diktat), bewegen ein Wort im Karteikasten. Alle anderen bringen Sterne, aber keinen Fachwechsel.

## 5. Schreiben mit Pencil und Finger

**Schreibfläche:** Grundschul-Lineatur (vier Linien, farbiges Mittelband), Höhe einstellbar, Pencil und Finger gleichwertig. Sobald ein Pencil erkannt wurde, werden Finger-Berührungen auf der Fläche ignoriert (Handballen). Glatte Striche mit Druckstärke, Knöpfe für „Rückgängig“ und „Neu“. Linkshänder-Modus: Vorlage rechts statt links. Die App speichert die Striche als vereinfachte Punktlisten, nicht als Bilder.

**Kontrolle in vier Stufen**, weil eine browserseitige Handschrifterkennung fehlt:

1. **Nachspuren, automatisch:** Das Vorlagewort wird in der Schulschrift unsichtbar gerendert, daraus eine Abstandskarte. Bewertet wird, wie viel Tinte nahe an der Vorlage liegt und wie viel der Vorlage abgedeckt ist. Ergebnis 1 bis 3 Sterne.
2. **Selbstkontrolle:** Nach dem Schreiben erscheint das richtige Wort darüber, Buchstabe für Buchstabe. Das Kind tippt „Alles richtig“ oder tippt den Buchstaben an, der falsch war. Die App merkt sich Fehlerstellen pro Wort (z. B. immer d/t), das hilft Eltern und der Übungsauswahl. Die Selbstkontrolle ist pädagogisch gewollt, das ist der „Vergleichen“-Schritt der Lernwörterkartei.
3. **Eltern-Durchsicht:** Im Elternbereich lassen sich die letzten Versuche ansehen und als richtig oder falsch markieren. Das überstimmt die Selbstkontrolle.
4. **Automatische Erkennung, optional:** nur nach erfolgreichem Spike (M0). Möglichkeiten: iPadOS-Scribble in einem Textfeld (nur Pencil, Risiko: Autokorrektur verdeckt Rechtschreibfehler) oder eine native Hülle mit Apples Vision-Texterkennung (Deutsch, Sprachkorrektur aus). Erst messen, dann entscheiden.

## 6. Karteikasten

Fünf Fächer wie in Voc a Bit ab Version 1.12, Tempo „Schnell“: richtig aus dem Gedächtnis heißt morgen ein Fach weiter, höchstens ein Fach pro Tag, falsch heißt zurück in Fach 1. Fach 5 ruht sieben Tage. Gerechnet wird in **Kalendertagen** (Datumsrechnung, nicht „plus 24 Stunden“, wegen Zeitumstellung). Runden werden mit festen Anteilen gebaut, nicht mit einer Gewichtung: höchstens die Hälfte fällige Wörter, dann neue Wörter der Woche, dann Rest. Ein heute schon richtiges Wort kommt heute nicht wieder.

## 7. Belohnung auf Grundschulniveau

Kein Druck, keine Ranglisten, keine roten Kreuze. Fehler heißen „Nochmal probieren“ mit sanftem Ton.

- **Sterne** pro Aufgabe (1 bis 3), sichtbar als Zahl und als Glas, das sich füllt.
- **Sticker** für jede erledigte Tagesstation, Stickeralbum mit Themenseiten (Tiere, Weltraum, Dinos, das Kind wählt).
- **Begleiter:** ein kleines Wesen, das mit Sternen wächst oder sich verkleidet. Nur positiv, es wird nie traurig oder hungrig.
- **Wochenstempelkarte** Montag bis Freitag statt einer Serie, die reißen kann.
- **Diktat-Pokal** am Freitag, in Gold, Silber oder Bronze je nach Fehlerzahl, jeder Versuch gibt etwas.
- **Abzeichen** mit Bildern statt Text, z. B. „Silbenkönig“, „Spurenleser“, „10 Wörter in Fach 5“.
- **Tagesziel klein:** 3 Stationen oder 10 Minuten. Nach 20 Minuten schlägt die App freundlich eine Pause vor.
- Konfetti, kurze Melodien, Vorlesen der Lobsätze.

## 8. Wörter aufnehmen (Foto-Import)

Weil die Web-App selbst kein Foto auslesen kann, läuft es wie in Voc a Bit über Claude:

1. Elternbereich → „Neue Woche“ → „Anleitung kopieren“.
2. In der Claude-App das Foto des Arbeitsblatts anhängen, Anleitung einfügen, senden.
3. Claudes JSON-Antwort in die App einfügen. Die App zeigt eine Vorschau mit allen Wörtern, Eltern korrigieren und bestätigen, Diktattermin wählen.

Die Anleitung lässt Claude pro Wort ausgeben: Wort in Originalschreibung, Artikel bei Nomen, Wortart, FRESCH-Kategorie, Silbentrennung, schwierige Stellen mit Typ und Tipp, einen kurzen kindgerechten Beispielsatz. Silbenkönige berechnet die App selbst.

Zusätzlich manuelle Eingabe Wort für Wort, mit automatischen Vorschlägen (Silben nach einfacher Regel, Vokale, typische Stellen wie ie, ck, tz, sp/st am Anfang, Auslaut d/t/g/k/b/p), die Eltern bestätigen. Fotos werden nicht gespeichert und nie ins Repo gelegt.

Optional: eine kleine eingebaute Startliste häufiger Wörter, frei zusammengestellt, damit die App ohne Import nutzbar ist. Amtliche Grundwortschatz-Listen nicht ungeprüft einbetten.

## 9. Oberfläche für ein Kind auf dem iPad

- Querformat zuerst, Hochformat muss funktionieren. Große Ziele, mindestens 60 pt.
- Wenig Text, viele Bilder und Symbole. Jede Anweisung hat einen Lautsprecher-Knopf und wird beim ersten Mal vorgelesen.
- Schulschrift mit einfachem a und g, z. B. Andika (SIL Open Font License) oder eine Grundschrift mit passender Lizenz. Schrift selbst ausliefern, damit sie offline da ist.
- Wortarten-Farben wie in der Schule: Nomen blau, Verben rot, Adjektive grün.
- Startbildschirm: Wochenweg mit fünf Stationen, Begleiter, Sterneglas, großer Knopf „Los geht’s“.
- **Elternbereich** hinter einer Rechenfrage (z. B. 7 × 8), dort: Wochen, Import, Fortschritt, Fehlerstellen, Durchsicht, Einstellungen, Sicherung.
- Mehrere Kinderprofile, falls gewünscht (siehe 11).

## 10. Technik

**Empfehlung Phase 1: Web-App wie Voc a Bit**, weil Thomas den Weg kennt, kein App Store nötig ist und sie kostenlos über GitHub Pages läuft:

- Eine Datei `index.html` mit CSS und JS, kein Framework, kein Build. Zeichnen mit Canvas und Pointer Events (`pointerType` pen/touch, Druck, `touch-action: none`), iOS-Lupe und Textauswahl auf der Fläche abschalten.
- Service Worker für Offline-Betrieb, Versionsnummer an zwei Stellen, Prüfskript `tools/check.sh` vor jedem Commit.
- Lernstand in `localStorage`, Schreibversuche in IndexedDB (begrenzt, z. B. die letzten drei pro Wort).
- Sprachausgabe Deutsch über `speechSynthesis` (de-DE).
- Sicherung über das Teilen-Menü mit Datei, Laden über Dateiauswahl.
- Eigenes Repo und eigener Ordner, z. B. `~/Downloads/lernwoerter`, mit `CLAUDE.md`, `HANDOFF.md`, `README.md`, `.gitignore` nach dem Muster von Voc a Bit.

**Phase 2, nur bei Bedarf:** native Hülle für automatische Handschrifterkennung, entweder SwiftUI mit WKWebView und Brücke zu Vision, oder Tauri 2 für iOS. Kostenfrage für Thomas: Mit kostenloser Apple-ID läuft eine selbst installierte App nur 7 Tage, das Entwicklerprogramm kostet 99 € pro Jahr.

**Datenmodell (Vorschlag):**

- Wort: `{ id, wort, artikel, wortart: nomen|verb|adjektiv|andere, art: mitsprech|nachdenk|merk, silben: ["Lam","pe"], stellen: [{ von, bis, typ: verlaengern|ie|doppel|ck|tz|h|sp|st|merk, tipp }], satz }`. Ids sind fest, der Lernstand hängt daran.
- Woche: `{ id, titel, diktat: "JJJJ-MM-TT", woerter: [ids], fehlerwoerter: [ids] }`.
- Lernstand pro Kind: `{ w: { id: { fach, faellig, richtig, falsch, fehlerstellen: { position: anzahl } } }, sterne, sticker, abzeichen, tage, einstellungen }`.

**Erfahrungen aus Voc a Bit, unbedingt beachten:**

- `<a download>` versagt in Home-Bildschirm-Apps, Sicherung über `navigator.share` mit Datei.
- Ton auf iOS erst nach dem ersten Tippen freischalten, Sprachausgabe synchron aus dem Tipp-Handler starten.
- Nach jedem Update muss die Home-Bildschirm-App komplett geschlossen und zweimal geöffnet werden. In jeder Release-Nachricht dazusagen.
- Home-Bildschirm-App und Safari-Tab haben getrennte Speicher. Lernstand wechselt nur per Sicherung. App nie vom Home-Bildschirm löschen, sonst ist der Stand weg.
- Bildschirmzeit: Safari erlauben, Webinhalt auf „Nur erlaubte Websites“ mit der Pages-Adresse stellen. So läuft nur diese App.
- Öffentliches Repo: keine Namen von Kindern, keine Fotos, keine Sicherungsdateien.
- Sandbox: `git init` und `git commit` außerhalb der Sandbox, `git push` mit `allowed_domains: github.com`. Ein öffentliches Repo anlegen und Pages einschalten macht Thomas selbst, gib ihm die zwei `gh`-Befehle.
- Lokale Vorschau: Projekt nach `$TMPDIR/<name>-mirror` spiegeln und einen Eintrag in `~/Downloads/.claude/launch.json` anlegen, direkt aus `~/Downloads` liefert der Server 404.
- Der angebundene Bildgenerator verlangt einen bezahlten Plan. Icons und Illustrationen als SVG zeichnen, im Browser per Canvas zu PNG rendern, PNG-Icons randlos.
- Commits mit den Attributionszeilen aus dem System-Hinweis.

## 11. Offene Entscheidungen (mit Empfehlung)

1. **Für wen?** Ein Kind der Familie oder mehrere, oder auch für andere Kinder oder eine Klasse? Empfehlung: zuerst die eigene Familie, Profile für Geschwister vorsehen. Bei Nutzung durch Fremde: Datenschutz und Lizenzen neu bewerten.
2. **Welche Schrift lernt das Kind?** Druckschrift, Grundschrift oder verbundene Schrift? Bestimmt die Vorlage beim Nachspuren. Empfehlung: Druckschrift mit Andika, umschaltbar später.
3. **Plattform:** Web-App (Empfehlung) oder gleich nativ?
4. **Kontrolle beim freien Schreiben:** Selbstkontrolle plus Eltern-Durchsicht (Empfehlung) oder automatische Erkennung anstreben?
5. **Name der App.** Vorschläge: „Wortwerkstatt“, „Schreibfuchs“, „Wörterbande“. Bestehende Marken prüfen.
6. **Belohnungsthema und Begleiter:** festes Thema oder Auswahl durch das Kind? Empfehlung: Auswahl beim ersten Start.
7. **Lineatur:** welche Lineatur nutzt die Schule (Klasse 2)? Empfehlung: einstellbar, Standard vier Linien mit Mittelband.
8. **Repo:** öffentlich mit GitHub Pages wie Voc a Bit? Empfehlung: ja, gleiche Regeln.

## 12. Fahrplan

| Schritt | Inhalt | Fertig, wenn |
|---|---|---|
| M0 Spikes | (a) Schreibfläche mit Pencil und Finger auf dem iPad, Lineatur, Handballen, Latenz; (b) Nachspur-Bewertung mit Abstandskarte; (c) Scribble-Test: werden falsch geschriebene Wörter autokorrigiert? (d) optional Vision-Erkennung mit 20 echten Schreibproben des Kindes | Thomas hat auf dem iPad geschrieben, Ergebnisse stehen in `HANDOFF.md`, Plattform ist entschieden |
| M1 Grundgerüst | Projekt, Profile, Elternbereich, manuelle Eingabe, Claude-Import, Wortkarte mit Sprachausgabe, Silben, Silbenkönige | eine Woche lässt sich anlegen und ansehen |
| M2 Schreibstationen | Abschreiben, Regenbogenschreiben, Blitzlesen, Merk-Diktat, Selbstkontrolle, Karteikasten | ein Wort wandert nach richtigem Schreiben aus dem Gedächtnis am nächsten Tag ein Fach weiter |
| M3 Automatische Übungen | Baukasten, Lückenwort, Wortarten sortieren, schwierige Stelle | alle drei FRESCH-Kategorien haben passende Übungen |
| M4 Woche und Diktat | Wochenweg, Tagesstation, Mini-Diktat, Fehlerwörter in die nächste Woche, Eltern-Durchsicht | ein kompletter Wochenablauf läuft durch |
| M5 Belohnung | Sterne, Sticker, Album, Begleiter, Stempelkarte, Pokal, Abzeichen | das Kind sieht nach jeder Station eine Belohnung |
| M6 Feinschliff | Icon, Offline-Test, Sicherung, Bildschirmzeit-Anleitung, iPad-Checkliste für Thomas | Test auf dem iPad bestanden und im Testprotokoll |

Nach jedem Meilenstein: lokal im Browser prüfen, committen, pushen, Thomas eine kurze Test-Checkliste geben.

## 13. Nicht ohne Rückfrage

- Kein Server, keine Konten, kein Tracking, keine Werbung, keine Push-Nachrichten.
- Kein Framework, kein Build-Schritt, solange Phase 1 läuft.
- Keine Kosten auslösen (Apple-Entwicklerprogramm, bezahlte Dienste) ohne Thomas.
- Pädagogische Grundlage aus Abschnitt 2 nicht verwässern: Schreiben bleibt Handschrift, Belohnung bleibt ohne Druck.
- Voc a Bit in `~/Downloads/wordbox` nicht verändern.
