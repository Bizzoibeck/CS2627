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
