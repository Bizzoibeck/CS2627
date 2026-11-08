SECTION .data ; Definieren einer Daten sekttion

; buffer: db 100 dup(0);             ; 100 Null-Bytes
num: dq  1337 ; Eine Nummer definieren mitdem label nu

SECTION .text ; Code sektion

global main ; macht main global verfügbar

main:; main metode
	; mov edx, 0;
	mov rax, [num];
	
	; mov ebx, 10;
	; div ebx;
	ret
