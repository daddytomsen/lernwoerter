# Schreibfuchs

Lernwörter-App für Klasse 2 auf dem iPad, mit Stift oder Finger. Web-App ohne Server, ohne Konto, ohne Tracking. Läuft über GitHub Pages, vom Home-Bildschirm und offline.

Das Kind übt die Lernwörter der Woche nach dem Rhythmus der Grundschule (Wochenweg Mo–Fr, Mini-Diktat am Diktattag), schreibt mit der Hand auf der Schul-Lineatur, vergleicht selbst und sammelt Sterne, Sticker und Abzeichen. Eltern legen die Wörter per Foto vom Arbeitsblatt über Claude an und sehen im Elternbereich Fortschritt und Schreibversuche.

## Auf das iPad holen

1. In Safari `https://daddytomsen.github.io/lernwoerter/` öffnen → Teilen → „Zum Home-Bildschirm“.
2. Über das Fuchs-Icon starten. Beim ersten Start legen die Eltern das Kind an, dann wählt das Kind sein Thema.
3. Nach jedem Update die App ganz schließen und **zweimal** öffnen.

Die App vom Home-Bildschirm und Safari haben getrennte Speicher. Die App nie vom Home-Bildschirm löschen, sonst ist der Lernstand weg. Vor Updates im Elternbereich eine Sicherung speichern.

## Bildschirmzeit: nur Schreibfuchs erlauben

Die App auf dem Home-Bildschirm ist technisch ein Teil von Safari. Ist Safari gesperrt, startet auch Schreibfuchs nicht. Darum Safari erlauben und nur diese Adresse freigeben:

1. Einstellungen → Bildschirmzeit → Beschränkungen (Inhalt & Datenschutz) → Erlaubte Apps & Funktionen → **Safari einschalten**.
2. Zurück → Inhaltsbeschränkungen → Webinhalt → **Nur erlaubte Websites**.
3. „Website hinzufügen“: Titel „Schreibfuchs“, URL `https://daddytomsen.github.io/lernwoerter/`. Weitere Adressen braucht die App nicht, Schriften und Bilder sind eingebaut.
4. Kein App-Limit für Safari setzen, das sperrt die App mit.

Dieselbe Anleitung steht in der App unter Elternbereich → Hilfe.

## Elternbereich

Zahnrad oben rechts, dann eine Rechenaufgabe lösen (zweistellig mal einstellig). Dort: Wochen anlegen (Foto über Claude oder von Hand), Fortschritt, Durchsicht der Schreibversuche, Einstellungen (Linienhöhe, Schrift, Linkshänder, Thema, weitere Kinder), Sicherung, Hilfe. Der Werkstatt-Test (`werkstatt.html`) prüft Stift und Lineatur.

## Schriften

Beide Schriften liegen im Ordner `fonts/` und stehen unter der SIL Open Font License 1.1:

- Playwrite DE Grund, © The Playwrite Project Authors (TypeTogether), `fonts/OFL-Playwrite.txt`
- Andika, © SIL International, `fonts/OFL-Andika.txt`

Icon, Sticker, Begleiter und Abzeichen sind eigene Zeichnungen (`icon.svg`, Inline-SVG in `index.html`).

## Datenschutz

Alles bleibt im Gerät. Keine Namen, keine Fotos, keine Schreibproben, keine Sicherungsdateien in diesem Repository.
