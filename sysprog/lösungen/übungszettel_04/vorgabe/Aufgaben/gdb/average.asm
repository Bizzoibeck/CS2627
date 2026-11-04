        global   main
        section  .text
main:
        lea      rsi, [array]           ; load start of array
        mov      rcx, [count]           ; load number of elements
        dec      rcx                    ; n-th element = array[n-1]
accumulate:
        mov      rax, [rsi+rcx*4]       ; load i-th element
        add      [sum], rax             ; accumulate sum as we go
        loop     accumulate             ; more numbers?
average:
        mov      rax, [sum]             ; prepare dividend
        div      qword [count]          ; rax is integer quotient, rdx is remainder
        ret

        section  .data
array:  dq       89, 10, 67, 1, 4, 27, 12, 34, 85, 1
count:  dq       10
sum:    dq       0