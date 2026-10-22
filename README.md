# Uni Bonn – WS 2026/27

Vorlesungsmaterialien, Übungen und Anki-Ablauf für meine Module im WS 2026/27.

| Modul | Ordner | Anki-Deck |
|---|---|---|
| Systemnahe Programmierung (BA-INF 034/129) | [sysprog/](sysprog) | `Sysprog` |
| Kommunikation in verteilten Systemen (BA-INF 101) | [kivs/](kivs) | `KIVS` |

Jedes Modul hat `Folien/`, `Übungszettel/`, `Altklausuren/`, `Material/` und `anki/LOG.md`.
SysProg hat zusätzlich `lösungen/übungszettel_NN/` für die eigene Bearbeitung. Die Ordner werden automatisch angelegt, sobald ein Blatt erscheint.

## Materialien aktualisieren

```bash
./scripts/sync.sh          # alle Module
./scripts/sync.sh kivs     # nur ein Modul
```

Das Skript liest die Kursseiten aus [courses.conf](courses.conf) und lädt nur neue oder auf dem Server geänderte Dateien. In Claude Code prüft ein Hook bei jeder Anfrage automatisch, ob der letzte erfolgreiche Abgleich mindestens 3 Tage her ist (Details in [AGENTS.md](AGENTS.md)).

## Neuer Rechner

```bash
cp .env.example .env   # Login/Passwort eintragen, nur außerhalb des Uni-Netzes nötig
```

`.env` ist gitignored. Die Skripte laufen unter macOS und Linux.
