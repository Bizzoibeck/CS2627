SECTION .data

str:	db `Hello world!\n`
strlen:	equ $ - str

num:	dq 1337

SECTION .text

global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, str
	mov rdx, strlen
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
