# Systemnahe Programmierung (BA-INF 034/129) – WS 2026/27

Universität Bonn, Institut für Informatik 4
Webseite: <https://net.cs.uni-bonn.de/de/wg/cs/lehre/ws-202627/sysprog/> (Alias: `sysprog.net.cs.uni-bonn.de`)

## Ordnerstruktur

| Ordner | Inhalt |
|---|---|
| [Folien/](Folien) | Vorlesungsfolien (Kapitel 0–3) |
| [Übungszettel/](Übungszettel) | Wöchentliche Übungsblätter |
| [Altklausuren/](Altklausuren) | Alte Klausuren WS13/14 + WS14/15, Signaturenliste wichtiger Systemfunktionen |
| [Material/](Material) | Zusatzmaterial: Makefile-Einführung, ASAN, `.gitignore`-Vorlage, Intel Code Table, Beispielsourcen |
| [lösungen/](lösungen) | Eigene Bearbeitung, ein Ordner `übungszettel_NN/` pro erschienenem Blatt (Abgabe über GitLab/Flavius) |
| [anki/LOG.md](anki/LOG.md) | Für welche Vorlesungen es schon Anki-Karten gibt (Deck `Sysprog`) |

Materialien aktualisieren und Einrichtung auf neuen Rechnern: siehe [README im Repo-Root](../README.md).

Hinweis: In Übungsblättern können Dateien eingebettet sein. Diese lassen sich mit `pdfdetach -saveall <datei>.pdf` extrahieren oder in Okular bzw. Adobe Reader öffnen.

## Personen & Kontakt

- **Dozenten:** Dr. Matthias Frank (`matthew@cs.uni-bonn.de`), Dr. Matthias Wübbeling (`matthias.wuebbeling@cs.uni-bonn.de`); modulverantwortlich ist Prof. Dr. Peter Martini
- **Übungsleitung:** Lennart Buhl M.Sc., Dylan Stogiani sowie 6 Tutor/innen
- **Mailingliste (Ankündigungen, Diskussion):** `vl-sys-prog@lists.iai.uni-bonn.de`, Anmeldung: <https://lists.iai.uni-bonn.de/mailman/listinfo.cgi/vl-sys-prog>
- **Organisatorische Fragen:** `tut-sys-prog@lists.iai.uni-bonn.de` (besser als Einzelpersonen anzuschreiben)

## Vorlesung

- **Di 14:15–15:45, HSZ – HS 2**, nur in Präsenz, ohne Livestream und ohne neue Aufzeichnungen
- Erste VL am 13.10.2026, letzte VL am 02.02.2027
- Weihnachtspause vom 24.12.2026 bis 06.01.2027; erste VL 2027 am 12.01.2027
- 2V + 2Ü, 6 LP. Pflicht für BA Cyber Security (3. Sem.), Wahlpflicht für BA Informatik und Lehramt

### Inhalte

0. Organisatorisches und C-Crashkurs (C wird **nicht** live in der VL behandelt, Selbststudium)
1. **Maschinenprogrammierung in Assembler**: x86/x86-64, Calling Conventions (C unter Linux), Bezug zur 2-Adressmaschine aus SysInf, Socket-Programmierung in Assembler. Ergänzend: `malloc` und `free`
2. **Prozesse und Threads**: Prozesse, Threads, IPC, Shared Memory, Synchronisation
3. **Netzwerkprogrammierung in C**: TCP/UDP/IP, Sockets, I/O-Multiplexing, Server-Strukturen

Empfohlene Vorkenntnisse sind Systemnahe Informatik (BA-INF 023) und C-Grundlagen.
Literatur: Kernighan & Ritchie *The C Programming Language*; [C von A bis Z](http://openbook.rheinwerk-verlag.de/c_von_a_bis_z/); [The C Book](https://publications.gbdirect.co.uk//c_book/)

## Übungen

- Wöchentliche Programmierübungen in **3er-Gruppen** (max. 4), nur in Präsenz im **CIP-Pool U1.012** (Keller)
- Anmeldung über [TVS](https://tvs.cs.uni-bonn.de/) (lief vom 09.10. bis 14.10.2026). Kleingruppen und Repos werden über [Flavius](https://flavius.cs.uni-bonn.de/) eingerichtet (nur im Informatik-Netz oder per VPN erreichbar)
- **Ein Informatik-Account ist zwingend nötig**, ohne ihn gibt es keinen Zugang zu git und GitLab
- Abgabe per git in [GitLab](https://gitlab.cs.uni-bonn.de): pro Blatt ein von Flavius erstellter **Merge Request bzw. Branch**. Abgaben auf anderen Branches werden nicht gewertet
- Ordnerstruktur pro Blatt: `aufgabe01/`, `aufgabe02/`, … Wer davon abweicht, bekommt **0 Punkte**
- **Ohne Makefile gibt es 0 Punkte.** Außerdem gehören dazu: kommentierter Code, eine README mit einer Kurzbeschreibung jeder Datei und ggf. ein Versuchsprotokoll
- Umgebung: **Ubuntu 24.04**, `clang` (C) und `nasm` (Assembler)
  ```bash
  sudo apt install build-essential clang valgrind git nasm
  ```
- Rhythmus: Blatt erscheint **mittwochs**, Abgabe **freitags 23:59** neun Tage später, Vorführung beim Tutor in der Folgewoche
- Projekt über mehrere Blätter: eine **simple Shell ohne C-Standardbibliothek**

### Bewertung und Zulassung

- 0, 2 oder 4 Punkte pro (Teil-)Aufgabe. Bei der Vorführung kann man sich von 0 auf 1 bzw. von 2 auf 3 verbessern
- Bewertet werden Korrektheit **und** Stil (Namen, Kommentare, Formatierung)
- Punkte gibt es nur nach Abnahme durch den Tutor. **Alle Gruppenmitglieder müssen die Lösung im Detail erklären können**, sonst gibt es Punktabzug, auch bei LLM-Nutzung
- **Klausurzulassung: ≥ 50 % der Punkte.** Bonusaufgaben zählen zum Punktestand, aber nicht zur Zulassungsgrenze
- Bei Plagiaten folgen Ausschluss vom Übungsbetrieb und keine Zulassung

## Klausur

- Schriftlich, 90 min, in Präsenz (Hörsaalgebäude Campus Poppelsdorf)
- **1. Termin: Februar 2027**, **2. Termin: März 2027**. Einen **dritten Termin gibt es nicht**
- Offizielle Termine: <https://www.informatik.uni-bonn.de/de/studium/pruefungsamt/bekanntmachungen/pruefungstermine>
- Bei Krankheit gelten die Hinweise des Prüfungsamts. Zusätzlich müssen die SysProg-Organisatoren per Mail informiert werden
- Die Altklausuren (WS13/14 und WS14/15) decken nicht alle aktuellen Themen ab. Die Signaturenliste wichtiger Systemfunktionen (Stand 27.01.2025) liegt in `Altklausuren/`

## Termine & Fristen (Übersicht)

| Datum | Was |
|---|---|
| 13.10.2026 | 1. Vorlesung |
| 14.10.2026 | Übungsblatt 1, Ende der TVS-Anmeldung |
| 19.–23.10.2026 | Orga-Tutorium, Flavius-Registrierung (Laptop mitbringen) |
| **25.10.2026 23:59** | **Abgabe Blatt 1** (Ausnahme: Sonntag) |
| 26.–30.10.2026 | Vorführung Blatt 1 |
| ab 02.11.2026 | regelmäßige Übungen und Vorführungen |
| 02.02.2027 | letzte Vorlesung |
| Feb. / März 2027 | Klausur (1. / 2. Termin) |

---
*Zuletzt mit der Webseite abgeglichen: siehe `../.last_sync`.*
