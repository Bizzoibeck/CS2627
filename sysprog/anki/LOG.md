# Anki-Log (Deck `Sysprog`)

Welche Vorlesungsabschnitte haben bereits ergänzte Karten? Neueste Einträge unten.

| Datum VL | Kapitel / Folien | Karten (Agent) | Stichworte |
|---|---|---|---|
| 2026-10-20 | Kap. 1.3 Allgemeines zu 80x86-Assembler (Folien 22–50) | 11 | Adressierungsarten, Indizierung/Array, Asm↔C (cmp/jge, (a+b)/2), mul/div RDX:RAX, ja vs. jg, CMP setzt nur Flags, loop, NASM-Größenangaben, Hello World/syscall |
| 2026-10-27 | Kap. 1.4–1.10 (Folien 51–84) + Ergänzung Speicherverwaltung malloc/free | 14 | ebp-Merksatz, Stack-Frame cdecl, Rücksprungadresse vs. gesicherter ebp, leave ersetzen, Klausurfehler [ebp+4] überschrieben, cdecl vs. AMD64, caller-/callee-saved, NASM data/text + Linken, RISC/CISC + MIPS-Formate, 2-Adressmaschine, Free-Liste/first fit, free + Zusammenfassen, malloc-Speicherbeispiel, typische malloc-Fehler |
| 2026-11-03 + 2026-11-10 | Kap. 2.1 Processes (komplett, 52 Folien) + Kap. 2.2 Threads Folien 1–27 (bis `pthread_create`) | 12 | fork-Rückgabe + File-Offset, fork-Trace (Blatt 4 A4), Zombie R/F, fork/exec/wait, WIFEXITED + SIGCHLD, Prozesszustände, Kontextwechsel/PCB, Prozess im Speicher R/F, Signale (SIGKILL/SIGSTOP), Threads teilen/eigen R/F, User- vs. Kernel-Threads + clone, pthread_create-Fallstricke |
