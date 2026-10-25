# AGENTS.md

Anweisungen für KI-Agenten (Claude Code, Codex, Cursor, …) in diesem Repo.

## Zweck

Materialsammlung für Module des WS 2026/27 an der Uni Bonn (Informatik 4). Die Module stehen in `courses.conf`:

| Ordner | Modul | Kursseite | Anki-Deck | Lösungsordner |
|---|---|---|---|---|
| `sysprog/` | Systemnahe Programmierung (BA-INF 034/129) | [Link](https://net.cs.uni-bonn.de/de/wg/cs/lehre/ws-202627/sysprog/) | `Sysprog` | ja |
| `kivs/` | Kommunikation in verteilten Systemen (BA-INF 101) | [Link](https://net.cs.uni-bonn.de/de/wg/cs/lehre/ws-202627/kommunikation-in-verteilten-systemen/) | `KIVS` | nein (Bearbeitung in separaten GitLab-Repos) |

Die wichtigsten Kursinfos (Termine, Fristen, Bewertung, Klausur) stehen in `<modul>/README.md`.

## Struktur

| Pfad | Inhalt |
|---|---|
| `courses.conf` | Ein Modul pro Zeile: `ordner\|kurs-url\|anki-deck\|lösungsordner (ja/nein)` |
| `<modul>/Folien/` | Vorlesungsfolien |
| `<modul>/Übungszettel/` | Übungsblätter |
| `<modul>/Altklausuren/` | Altklausuren (bei SysProg zusätzlich die Signaturenliste) |
| `<modul>/Material/` | Zusatzmaterial |
| `<modul>/lösungen/übungszettel_NN/` | Eigene Bearbeitung der Übungsblätter (nur Module mit Lösungsordner = ja). In `vorgabe/` liegen die in das PDF eingebetteten Dateien |
| `<modul>/anki/LOG.md` | Protokoll, für welche Vorlesungen bereits Anki-Karten ergänzt wurden |
| `scripts/sync.sh` | Lädt neue oder geänderte Dateien aller Module (oder `sync.sh <ordner>`) und sortiert sie nach URL-Pfad ein. Legt bei Bedarf Lösungsordner an |
| `scripts/check-sync.sh` | Führt `sync.sh` aus, wenn der letzte erfolgreiche Abgleich (`.last_sync`) mindestens 3 Tage zurückliegt |
| `.claude/settings.json` | Claude-Code-Hook: ruft `check-sync.sh` bei jeder neuen Nutzeranfrage auf |

Die Skripte laufen unter macOS und Linux (bash und curl).

## Pflichten des Agenten

1. **Neue Materialien prüfen:** Zu Beginn jeder neuen Anfrage `./scripts/check-sync.sh` ausführen, sofern das nicht bereits ein Hook erledigt hat (in Claude Code passiert das automatisch). Das Skript tut nichts, wenn der letzte erfolgreiche Abgleich weniger als 3 Tage zurückliegt. Schlägt ein Abgleich fehl, wird es bei der nächsten Anfrage erneut versucht.
2. **Termine aktuell halten:** Wochenplan, „Nächste Abgaben“ und Klausurtabelle in der Root-`README.md` sowie die Modul-READMEs pflegen. Offizielle Klausurtermine stehen unter <https://bamainfo.informatik.uni-bonn.de/public/pa/20262-pruefungen.html> (wird auf der Prüfungsamt-Seite eingebettet).
3. **Neue Dateien melden:** Zeilen mit `NEU/AKTUALISIERT:` und `NEUER LÖSUNGSORDNER:` dem Nutzer mitteilen. Die neuen PDFs lesen (z. B. mit `pdftotext`) und die `README.md` des Moduls aktualisieren: Termine, Abgabefristen, Inhalte, Tabelle „Termine & Fristen“.
4. **Committen:** Neue Materialien und README-Änderungen nur auf Wunsch des Nutzers committen.

## Zugangsdaten

- Im Uni-Netz oder per VPN ist kein Login nötig. Von außerhalb liest `sync.sh` die Zugangsdaten aus `.env` (Vorlage: `.env.example`): standardmäßig `SYSPROG_USER`/`SYSPROG_PASS`, pro Modul überschreibbar mit `<ORDNER>_USER`/`<ORDNER>_PASS` (z. B. `KIVS_USER`).
- `.env` ist gitignored. **Zugangsdaten niemals committen** und nicht in README, AGENTS.md oder andere getrackte Dateien schreiben.
- Auf einem neuen Rechner: `cp .env.example .env` und die Werte eintragen. Der Nutzer kennt sie, sie stammen aus der 1. Vorlesung.

## Konventionen

- Dateinamen vom Server unverändert übernehmen. Einzige Ausnahme: `gitignore` wird zu `Material/gitignore.txt`.
- Alte Versionen von Folien (z. B. `…_v1012…` neben `…_v1019…`) nicht löschen, ohne den Nutzer zu fragen.
- **Neues Modul:** Zeile in `courses.conf` ergänzen, `./scripts/sync.sh <ordner>` ausführen, `<ordner>/README.md` und `<ordner>/anki/LOG.md` anlegen, das Anki-Deck anlegen und die Tabelle oben ergänzen. Landen Dateien fälschlich in `Material/`, das Muster in `target_dir()` in `sync.sh` erweitern.

### Lösungsordner

- Für Module mit Lösungsordner = `ja` legt `sync.sh` pro Übungsblatt `<modul>/lösungen/übungszettel_NN/` an (NN = erste Zahl im Dateinamen des Blatts), mit einer `README.md`, die auf das Blatt verlinkt. In das PDF eingebettete Dateien (Vorlagen, Tests) werden mit `pdfdetach` nach `vorgabe/` entpackt; die eigene Lösung daneben anlegen, `vorgabe/` unverändert lassen.
- Ordner **nur für Blätter anlegen, die erschienen sind**, also keine Ordner auf Vorrat. Bestehende Lösungsordner nie überschreiben oder löschen.
- Ist die Nummer im Dateinamen nicht eindeutig, den Ordner von Hand anlegen und dem Nutzer Bescheid geben.

### Modul-spezifisch

- **KIVS:** Übungen werden in separaten GitLab-Repos bearbeitet, nicht hier. Keine Lösungsordner anlegen.

- **SysProg:** Übungsblätter werden in `sysprog/lösungen/übungszettel_NN/` bearbeitet; abgegeben wird über die Flavius-/GitLab-Repos der Gruppe. Bei Übungsaufgaben erklären statt fertige Lösungen liefern: Alle Gruppenmitglieder müssen ihre Abgabe im Detail erklären können, und in der Klausur gibt es keine LLMs.
- **SysProg:** **Assembler nur in Intel-Syntax (NASM).** AT&T-Syntax ist nicht relevant, auch wenn Altklausuren sie verwenden: Aufgaben daraus nach Intel übertragen.

## Anki-Karten

Pro Modul ein eigenes Deck (siehe Tabelle oben bzw. `courses.conf`). Für Anki-Zugriffe den Anki-Skill des Nutzers verwenden; ist keiner verfügbar, die Anki-Tools (AnkiConnect) direkt nutzen.

### Ablauf

1. Der Nutzer erstellt während der Vorlesung eigene Karten und sagt danach, welches Modul und welche Vorlesung
   bzw. welcher Folienbereich behandelt wurde. Der Agent ergänzt Karten **nur für diesen
   Abschnitt**, nicht für spätere Kapitel und nicht noch einmal für frühere.
   Ist unklar, was behandelt wurde: `<modul>/anki/LOG.md` und das Datum prüfen und beim Nutzer nachfragen.
2. Vorher `./scripts/sync.sh <modul>` ausführen, damit die aktuellen Folien und Blätter vorliegen.
3. Bestehende Karten im Deck lesen, auch die Bilder auf der Rückseite. Nichts doppelt anlegen.
   **Karten des Nutzers nie ändern oder löschen.**
4. Quellen, alle drei zusammen:
   - **Folien** des behandelten Abschnitts (`<modul>/Folien/`): Was wurde gelehrt?
   - **Übungszettel** zum Thema (`<modul>/Übungszettel/`): Welche Fähigkeiten werden geübt?
   - **Altklausuren** und, falls vorhanden, Hilfsblätter wie die Signaturenliste (`<modul>/Altklausuren/`):
     Wie wird das Thema geprüft (Code schreiben, Traces, Erklärfragen, Multiple Choice, Fehler finden, Rechenaufgaben)?
     Was in der Klausur als Hilfsmittel beiliegt, muss nicht auswendig gelernt werden.
5. Karten **direkt anlegen, ohne vorher nachzufragen**. **Danach prüfen, ob sie wirklich im richtigen Deck
   liegen** (z. B. `deck:Sysprog tag:claude`). Das Batch-Anlegen hat Karten schon einmal trotz korrekter
   Deck-Angabe im Deck „Standard“ abgelegt. In dem Fall die Karten ins richtige Deck verschieben.
   Danach dem Nutzer eine kurze Liste zeigen (Vorderseite + Quelle). Anschließend anbieten, Anki mit AnkiWeb zu synchronisieren.
6. `<modul>/anki/LOG.md` ergänzen: Datum, Kapitel/Folienbereich, Anzahl der Karten, Stichworte.

### Umfang und Stil

- **Wenige, klausurrelevante Karten:** etwa 5–12 pro Vorlesung. Lieber Lücken in den Nutzerkarten
  schließen und typische Klausuraufgaben abdecken als jede Folie abbilden.
- Deutsch, Notiztyp `Basic`, eine Frage pro Karte, kurze Antworten.
  Code in `<pre><code>`, keine langen Folientexte.
- Mischung: Verständnis („Warum …?“, „Was passiert, wenn …?“), Anwendung (kleiner Code-Ausschnitt
  oder kleine Rechnung) und Klausur-Muster (Aufgabentypen aus Altklausuren in Kartengröße).
- Hilfsmittel, die in der Klausur beiliegen (z. B. x86-Befehlsreferenz, Signaturenliste), nicht abfragen.
  Stattdessen die Anwendung abfragen (richtige Register, signed/unsigned, Fallstricke).
- Tags: `claude`, `kap<N>` (z. B. `kap1`), `vl-<YYYY-MM-DD>` sowie die Quelle
  `folie`, `uebung` und/oder `klausur`.
