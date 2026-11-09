%macro print 2
	mov rax, 1 ;1 in rax schreiben
	mov rdi, 1 ;1 in rdi schreiben
	mov rsi, %1 ;str addresse in rsi schreiben
	mov rdx, %2 ;strlen in rdx schreiben
	syscall ; Syscall ruft mit diesen parametern print aus.
%endmacro
SECTION .data ; Definieren einer Daten sekttion
BUFSIZE equ 64
num: dq  13371873 ; Eine Nummer definieren mitdem label nu
buf: times BUFSIZE db 0

SECTION .text ; Code sektion

global main ; macht main global verfügbar

printnumber:; main metode
	push rbx
	mov rbx, 10
	mov r8, BUFSIZE-1; len
loop:
	mov rdx, 0
	div rbx
	add rdx, 48
	lea r9, [rel buf]
	mov [r9+r8], dl
	sub r8,1
	test rax, rax
	jnz loop
final:
	add r8, 1
	mov r10, BUFSIZE; len
	sub r10, r8
	add r9, r8; string start
	print r9, r10; ausgabe
	pop rbx
	mov rax, 0
	ret
main:
mov rax, [rel num]
call printnumber
mov rax, 1234567
call printnumber
mov rax, 60; 60 in rax schreiben
mov rdi, 0; 0 in rdi schreiben
syscall ; syscall führt mit diesen parametern ein exit aus.
