# Uni Bonn – WS 2026/27

## ToDo

- [x] **KIVS:** Vorlesung vom Do 22.10. nacharbeiten ([Folien](kivs/Folien))
- [x] **SysProg Blatt 1, A3:** String- und Byteblock-Funktionen ([Blatt](sysprog/Übungszettel/Uebungsblatt01.pdf), [Ordner](sysprog/lösungen/übungszettel_01)), nur zur Übung
- [x] **SysProg Blatt 1, A6:** Fehlersuche bei Speicherverwaltung, nur zur Übung
- [x] **KIVS Zettel 01** ([Blatt](kivs/Übungszettel/kivs2026ex01.pdf))
- [x] **KIVS Zettel 02** ([Blatt](kivs/Übungszettel/kivs2026ex02.pdf)): Dämpfung/Verstärkung, Free Space Path Loss. Abgabe **Fr 06.11., 23:59**, im GitLab-Repo (zählt für die Zulassung)
- [ ] **SysProg Blatt 3** ([Blatt](sysprog/Übungszettel/Uebungsblatt03.pdf), [Ordner](sysprog/lösungen/übungszettel_03)): Syscall-Wrapper, gdb, Compiler-Optimierungen. Geplant fürs Wochenende 07./08.11., nur zur Übung
- [ ] **SysProg Blatt 4** ([Blatt](sysprog/Übungszettel/Uebungsblatt04.pdf), [Ordner](sysprog/lösungen/übungszettel_04)): gdb mit Assembler, Matrixaddition, Adressierung, `fork()`, **A5 Speicherverwaltung (klausurrelevant!)**. Frist Fr 13.11., nur zur Übung

## Vor der Klausur nachholen

Liegengebliebenes, das vor der Klausur noch angeschaut werden muss:

- [ ] **SysProg Blatt 2** ([Blatt](sysprog/Übungszettel/Uebungsblatt02.pdf), [Ordner mit Vorlagen](sysprog/lösungen/übungszettel_02)): Springerproblem, Fehlersuche/Debugger, **Hello World in Assembler** (A3 am wichtigsten). Klausur SysProg: Mi 17.02.2027

Vorlesungsmaterialien, Übungen und Anki-Ablauf für meine Module im WS 2026/27.

| Modul | Ordner | Anki-Deck |
|---|---|---|
| Systemnahe Programmierung (BA-INF 034/129) | [sysprog/](sysprog) | `Sysprog` |
| Kommunikation in verteilten Systemen (BA-INF 101) | [kivs/](kivs) | `KIVS` |

Jedes Modul hat `Folien/`, `Übungszettel/`, `Altklausuren/`, `Material/` und `anki/LOG.md`.
SysProg hat zusätzlich `lösungen/übungszettel_NN/` für die eigene Bearbeitung. Die Ordner werden automatisch angelegt, sobald ein Blatt erscheint. Eingebettete Vorlagen aus dem PDF landen dort in `vorgabe/`.

## Wochenplan

| Tag | Zeit | Was | Ort |
|---|---|---|---|
| Di | 14:15–15:45 | SysProg Vorlesung | HSZ, HS 2 |
| Do | 10:15–11:45 | KIVS Vorlesung | HSZ, HS 7 |
| nach Gruppe | 90–120 min | SysProg Übung/Vorführung | U1.012 (CIP-Pool) |
| nach TVS-Zuteilung | 2 h | KIVS Übung | U.039 (Mi 10–12: U.028) |

### Nächste Abgaben

| Fällig | Modul | Blatt |
|---|---|---|
| **Fr 06.11.2026, 23:59** | **KIVS** | **Übungszettel 02** (Präsentation 09.–11.11.) |
| Fr 06.11.2026, 23:59 | SysProg | Übungsblatt 3 (Vorführung 09.–13.11.) |
| Fr 13.11.2026, 23:59 | SysProg | Übungsblatt 4 (Vorführung 16.–20.11.) |

In der Regel: SysProg-Blätter sind freitags 23:59 fällig, 9 Tage nach Erscheinen. KIVS-Blätter erscheinen donnerstags, Abgabe meist freitags 23:59. Details stehen in der jeweiligen Modul-README.

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
