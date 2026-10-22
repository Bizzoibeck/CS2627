# Uni Bonn – WS 2026/27

Vorlesungsmaterialien, Übungen und Anki-Ablauf für meine Module im WS 2026/27.

| Modul | Ordner | Anki-Deck |
|---|---|---|
| Systemnahe Programmierung (BA-INF 034/129) | [sysprog/](sysprog) | `Sysprog` |
| Kommunikation in verteilten Systemen (BA-INF 101) | [kivs/](kivs) | `KIVS` |

Jedes Modul hat `Folien/`, `Übungszettel/`, `Altklausuren/`, `Material/` und `anki/LOG.md`.
SysProg hat zusätzlich `lösungen/übungszettel_NN/` für die eigene Bearbeitung. Die Ordner werden automatisch angelegt, sobald ein Blatt erscheint.

## Wochenplan

| Tag | Zeit | Was | Ort |
|---|---|---|---|
| Di | 14:15–15:45 | SysProg Vorlesung | HSZ, HS 2 |
| Do | 10:15–11:45 | KIVS Vorlesung | HSZ, HS 7 (unbestätigt) |
| nach Gruppe | 90–120 min | SysProg Übung/Vorführung | U1.012 (CIP-Pool) |

Laufende Abgaben: SysProg-Blätter erscheinen mittwochs und sind **freitags 23:59** fällig (9 Tage später). Details stehen in der jeweiligen Modul-README.

## Klausuren

| Datum | Zeitfenster | Modul | Termin |
|---|---|---|---|
| **Mi 17.02.2027** | 11:00–14:00 | SysProg | 1. Termin |
| **Fr 19.02.2027** | 12:00–15:00 | KIVS | 1. Termin |
| Do 11.03.2027 | 09:00–12:00 | SysProg | 2. Termin |
| Di 16.03.2027 | 09:00–12:00 | KIVS | 2. Termin |

Quelle: [Prüfungsamt Informatik](https://www.informatik.uni-bonn.de/de/studium/pruefungsamt/bekanntmachungen/pruefungstermine) (angegeben ist die Raumreservierung, die Klausur liegt innerhalb davon). Vorlesungsfrei: 24.12.2026–06.01.2027.

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
