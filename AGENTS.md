# AGENTS.md

Anweisungen für KI-Agenten (Claude Code, Codex, Cursor, …) in diesem Repo.

## Zweck

Materialsammlung für das Modul **Systemnahe Programmierung (BA-INF 034/129), WS 2026/27, Uni Bonn**.
Kursseite: <https://net.cs.uni-bonn.de/de/wg/cs/lehre/ws-202627/sysprog/>
Die wichtigsten Kursinfos (Termine, Fristen, Bewertung, Klausur) stehen in `README.md`.

## Struktur

| Pfad | Inhalt |
|---|---|
| `Folien/` | Vorlesungsfolien |
| `Übungszettel/` | Übungsblätter |
| `Altklausuren/` | Altklausuren und Signaturenliste |
| `Material/` | Zusatzmaterial (Makefile, ASAN, gitignore-Vorlage, Beispielsourcen, …) |
| `scripts/sync.sh` | Lädt neue oder geänderte Dateien von der Kursseite und sortiert sie nach URL-Pfad ein (`/Folien/`, `/UeZettel/`, `/Altklausuren/`, sonst `Material/`) |
| `scripts/check-sync.sh` | Führt `sync.sh` aus, wenn der letzte Abgleich (`.last_sync`) mindestens 3 Tage zurückliegt |
| `anki/LOG.md` | Protokoll, für welche Vorlesungen bereits Anki-Karten ergänzt wurden |
| `.claude/settings.json` | Claude-Code-Hook: ruft `check-sync.sh` bei jeder neuen Nutzeranfrage auf |

Die Skripte laufen unter macOS und Linux (bash und curl).

## Pflichten des Agenten

1. **Neue Materialien prüfen:** Zu Beginn jeder neuen Anfrage `./scripts/check-sync.sh` ausführen, sofern das nicht bereits ein Hook erledigt hat (in Claude Code passiert das automatisch). Das Skript tut nichts, wenn der letzte Abgleich weniger als 3 Tage zurückliegt.
2. **Neue Dateien melden:** Zeilen mit `NEU/AKTUALISIERT:` dem Nutzer mitteilen. Die neuen PDFs lesen (z. B. mit `pdftotext`) und `README.md` aktualisieren: Termine, Abgabefristen, Inhalte, Tabelle „Termine & Fristen“.
3. **Committen:** Neue Materialien und README-Änderungen nur auf Wunsch des Nutzers committen.

## Zugangsdaten

- Im Uni-Netz oder per VPN ist kein Login nötig. Von außerhalb liest `sync.sh` die Zugangsdaten aus `.env` (Vorlage: `.env.example`).
- `.env` ist gitignored. **Zugangsdaten niemals committen** und nicht in README, AGENTS.md oder andere getrackte Dateien schreiben.
- Auf einem neuen Rechner: `cp .env.example .env` und die Werte eintragen. Der Nutzer kennt sie, sie stammen aus der 1. Vorlesung.

## Konventionen

- Dateinamen vom Server unverändert übernehmen. Einzige Ausnahme: `gitignore` wird zu `Material/gitignore.txt`.
- Alte Versionen von Folien (z. B. `…_v1012…` neben `…_v1019…`) nicht löschen, ohne den Nutzer zu fragen.
- Eigene Lösungen zu Übungsblättern gehören in die Abgabe-Repos auf gitlab.cs.uni-bonn.de, nicht in dieses Repo. Bei Übungsaufgaben erklären statt fertige Lösungen liefern: Alle Gruppenmitglieder müssen ihre Abgabe im Detail erklären können, und in der Klausur gibt es keine LLMs.

## Anki-Karten

Deck: **`Sysprog`**. Für Anki-Zugriffe den Anki-Skill des Nutzers verwenden; ist keiner verfügbar, die Anki-Tools (AnkiConnect) direkt nutzen.

### Ablauf

1. Der Nutzer erstellt während der Vorlesung eigene Karten und sagt danach, welche Vorlesung
   bzw. welcher Folienbereich behandelt wurde. Der Agent ergänzt Karten **nur für diesen
   Abschnitt**, nicht für spätere Kapitel und nicht noch einmal für frühere.
   Ist unklar, was behandelt wurde: `anki/LOG.md` und das Datum prüfen und beim Nutzer nachfragen.
2. Vorher `./scripts/sync.sh` ausführen, damit die aktuellen Folien und Blätter vorliegen.
3. Bestehende Karten im Deck lesen, auch die Bilder auf der Rückseite. Nichts doppelt anlegen.
   **Karten des Nutzers nie ändern oder löschen.**
4. Quellen, alle drei zusammen:
   - **Folien** des behandelten Abschnitts (`Folien/`): Was wurde gelehrt?
   - **Übungszettel** zum Thema (`Übungszettel/`): Welche Fähigkeiten werden geübt
     (z. B. Funktionen ohne libc, Makefile, Assembler mit C kombinieren)?
   - **Altklausuren** und **Signaturenliste** (`Altklausuren/`): Wie wird das Thema geprüft
     (Code schreiben, Assembler-Trace, Register- und Stackinhalte, Erklärfragen, Fehler finden)?
     Was die Signaturenliste in der Klausur bereitstellt, muss nicht auswendig gelernt werden.
5. Karten **direkt anlegen, ohne vorher nachzufragen**. **Danach prüfen, ob sie wirklich im Deck `Sysprog`
   liegen** (`deck:Sysprog tag:claude`). Das Batch-Anlegen hat sie schon einmal trotz Angabe von `Sysprog`
   im Deck „Standard“ abgelegt. In dem Fall die Karten nach `Sysprog` verschieben. Danach dem Nutzer eine kurze Liste zeigen
   (Vorderseite + Quelle). Anschließend anbieten, Anki mit AnkiWeb zu synchronisieren.
6. `anki/LOG.md` ergänzen: Datum, Kapitel/Folienbereich, Anzahl der Karten, Stichworte.

### Umfang und Stil

- **Wenige, klausurrelevante Karten:** etwa 5–12 pro Vorlesung. Lieber Lücken in den Nutzerkarten
  schließen und typische Klausuraufgaben abdecken als jede Folie abbilden.
- Deutsch, Notiztyp `Basic`, eine Frage pro Karte, kurze Antworten.
  Code in `<pre><code>`, keine langen Folientexte.
- Mischung: Verständnis („Warum …?“, „Was passiert, wenn …?“), Anwendung (kleiner Code- oder
  Assembler-Ausschnitt: Was steht danach in `rax`/auf dem Stack?) und
  Klausur-Muster (Aufgabentypen aus Altklausuren in Kartengröße).
- **Assembler nur in Intel-Syntax (NASM).** AT&T-Syntax ist nicht relevant, auch wenn Altklausuren sie
  verwenden: Aufgaben daraus nach Intel übertragen.
- Was in der Klausur als Hilfsmittel beiliegt (x86-Befehlsreferenz, Signaturenliste), nicht abfragen.
  Stattdessen die Anwendung abfragen (richtige Register, signed/unsigned, Fallstricke).
- Tags: `claude`, `kap<N>` (z. B. `kap1`), `vl-<YYYY-MM-DD>` sowie die Quelle
  `folie`, `uebung` und/oder `klausur`.
