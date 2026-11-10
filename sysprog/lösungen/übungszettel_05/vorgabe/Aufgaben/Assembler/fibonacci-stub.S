SECTION .data

; define the fibonacci number that should be calculated
n:	dq	10

SECTION .text

global _start

_start:
	; call Fibonacci function f(n)
	mov rdi, [n] ; parameter: fibonacci number to calulculate
	call f ; call function

	; print calculated Fibonacci number on stdout
	call printnumber

	; exit process with exit code 0
	mov rax, 60
	mov rdi, 0
	syscall

; f: Calculates a Fibonacci number
; f(n) = {n, if n <= 1; f(n - 1) + f(n - 2), else}
; Parameter: Integer n >= 0, passed using AMD64 ABI convention
; Returns: Fibonacci number f(n), returned in rax
f:
	; ...
	ret
