SECTION .data ; Definieren einer Daten sekttion

str:	db `Hello world!\n` ;String definieren mit label str
strlen:	equ $ - str ;Länge des strings durch vergleichen der addressen definieren mit label strlen

num:	dq 1337; Eine Nummer definieren mitdem label num

SECTION .text ; Code sektion

global main ; macht main global verfügbar

main:; main metode
	mov rax, 1 ;1 in rax schreiben
	mov rdi, 1 ;1 in rdi schreiben
	mov rsi, str ;str addresse in rsi schreiben
	mov rdx, strlen ;strlen adresse in rdx schreiben
	syscall ; Syscall ruft mit diesen parametern print aus.

	mov rax, 60; 60 in rax schreiben
	mov rdi, 0; 0 in rdi schreiben
	syscall ; syscall führt mit diesen parametern ein exit aus.
