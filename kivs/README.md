# Kommunikation in verteilten Systemen (BA-INF 101) – WS 2026/27

Kursseite: <https://net.cs.uni-bonn.de/de/wg/cs/lehre/ws-202627/kommunikation-in-verteilten-systemen/>
Zugriff von außerhalb mit den KIVS-Zugangsdaten (`KIVS_USER`/`KIVS_PASS` in `.env`), im Uni-Netz oder per VPN ohne.

## Ordnerstruktur

| Ordner | Inhalt |
|---|---|
| [Folien/](Folien) | Vorlesungsfolien (Kap. 0–2, Orga-Slides) |
| [Übungszettel/](Übungszettel) | Übungsblätter (`kivs2026exNN.pdf`) |
| [Altklausuren/](Altklausuren) | Altklausuren (bisher keine veröffentlicht) |
| [Material/](Material) | Zusatzmaterial |
| [anki/LOG.md](anki/LOG.md) | Für welche Vorlesungen es schon Anki-Karten gibt (Deck `KIVS`) |

Übungen werden in separaten GitLab-Repos bearbeitet, nicht in diesem Repo. In den Übungsblättern sind Testdateien (`test.py`) und Beispieldaten eingebettet. Sie lassen sich mit `pdfdetach -saveall` oder in Okular, Evince bzw. Acrobat öffnen.

## Personen & Kontakt

- **Vorlesung:** Prof. Dr. Peter Martini, Dr. Matthias Frank
- **Übung:** Dr. Matthias Frank, Lennart Buhl M.Sc., Dylan Stogianni M.Sc.; Tutorinnen: Ellen Bundschuh (Mo), Maria Alexander (Di), Aura Pop (Mi)
- **Mailingliste (Ankündigungen, inhaltliche Fragen):** `vl-kivs@lists.iai.uni-bonn.de`, Anmeldung: <https://lists.iai.uni-bonn.de/mailman/listinfo.cgi/vl-kivs>
- **Tutorenteam:** `tut-kivs@lists.iai.uni-bonn.de`
- **Organisatorisches:** `orga-kivs@lists.iai.uni-bonn.de` (besser als Einzelpersonen anzuschreiben)

## Vorlesung

- **Do 10:15–11:45** (10 c.t.–12), wöchentlich, **HSZ, HS 7**. Beginn am 15.10.2026
- 2V + 2Ü, 6 LP. Für BA Informatik, BA Cyber Security und BA Lehramt
- Folien sind auf Englisch

### Inhalte

0. Organisatorisches, Zusatzfolien Lehre (CA&D)
1. **Introduction and Motivation:** Namen, Wireless Communication, das Internet, Hierarchieprinzip und Schichtenmodelle, Packet Sniffing mit Wireshark
2. **Physical Layer:** Datenkommunikationsmodell, Dämpfung und Verzerrung, Frequenzbereich, Datenrate und Bandbreite, Rauschen, analoge Übertragung digitaler Daten, PCM, Synchronisation
3. **Data Link Layer:** Framing, LAN-Nachrichtenformate, Fehlerkorrektur, Mehrfachzugriff, Medium Access Control
4. **Network Layer:** Adressierung, Abbildung von SAPs, Routing, NAT, Firewalls
5. **Transport Layer:** Transportdienste, Adressierung, UDP, TCP, QUIC

## Übungen

- Anmeldung über [TVS](https://tvs.cs.uni-bonn.de) (Frist war der 22.10.2026, 23:59). Abgabegruppen über [Flavius](https://flavius.cs.uni-bonn.de/) und [GitLab](https://gitlab.cs.uni-bonn.de). **Ein aktiver Informatik-Account ist nötig**
- 6 Übungstermine zur Auswahl:
  - Mo 14–16, Mo 16–18, Di 14–16, Di 16–18 und Mi 14–16 in **U.039**
  - Mi 10–12 in **U.028**
- Blätter erscheinen in der Regel **donnerstags** (am Vorlesungstag) und werden innerhalb einer Woche bearbeitet. Abgabe meist **freitags 23:59**, der genaue Termin steht auf dem Blatt
- Abgabe in Gruppen von 2–3 Personen, Einzelabgaben sind nicht erlaubt. Pro Blatt gibt es einen Branch/Merge Request in GitLab
  - Lösungen direkt auf den Branch legen, ohne unnötige Unterordner
  - Programme müssen per `run.sh` aufrufbar sein und erkennen die Teilaufgabe am ersten Kommandozeilenparameter (Beispiele: <https://gitlab.com/tallion/kivs-sample-projects>)
  - Theorieaufgaben gehören in **eine PDF-Datei**
  - Bewertet wird automatisiert getestet. Die eingebettete `test.py` prüft das Schema vorab
  - Nur Bibliotheken, die den Kern der Aufgabe nicht vorwegnehmen. Die Sprache ist frei, das Programm muss aber unter Linux laufen
- Die eigene Lösung muss in der Übung vorgestellt werden können
- **Zulassung: ≥ 50 % der Punkte über alle Zettel**. Es gibt Pflicht- und optionale Aufgaben

## Klausur

- Schriftliche Präsenzklausur. Räume werden rechtzeitig bekannt gegeben
- **Erstklausur: Fr 19.02.2027, 12:00–15:00**
- **Nachklausur: Di 16.03.2027, 09:00–12:00**
- Angegeben ist das Zeitfenster der Raumreservierung. Offizielle Termine: <https://www.informatik.uni-bonn.de/de/studium/pruefungsamt/bekanntmachungen/pruefungstermine>
- Hinweis aus den Orga-Folien: Die Vorlesung hat viele Themen, also regelmäßig wiederholen

## Termine & Fristen (Übersicht)

| Datum | Was |
|---|---|
| 15.10.2026 | 1. Vorlesung |
| 22.10.2026 23:59 | Ende der TVS-Anmeldung |
| 23.10.2026 | Übungszettel 01 (Flavius, Hello World, Wireshark-Analyse, Pfade im Internet, Grenzen der Kommunikation) |
| **01.11.2026 23:59** | **Abgabe Zettel 01** (Ausnahme: Sonntag) |
| 02.–04.11.2026 | Präsentation Zettel 01 in den Tutorien |
| **19.02.2027** | **Erstklausur** (12–15 Uhr) |
| **16.03.2027** | **Nachklausur** (9–12 Uhr) |

---
*Zuletzt mit der Webseite abgeglichen: siehe `../.last_sync`.*
