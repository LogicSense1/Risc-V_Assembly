        .text
        .globl  fib
        .type   fib, @function
fib:
        addi sp, sp,-8     # adjust stack for 2 items
        sw   ra, 4(sp)      # save return address
        sw   a0, 0(sp)      # save argument - this is a local variable allocated on the stack
        li   t0, 0         
        beq  a0, t0, L0
        li   t1, 1
        beq  a0, t1, L1     # if n >= 2 take jump
        addi a0,a0,-1
        jal  fib
        sw   a5,400(sp)
        lw   a0,0(sp)
        addi a0, a0,-2
        jal  fib
        sw   a5,412(sp)
        lw   a0,0(sp)
        lw   a4,400(sp)
        lw   a3,412(sp)
        add  a5,a4,a3
        lw   ra, 4(sp)      # restore return address
        addi sp, sp,8    # pop 2 items from stack 
        jr   ra            # and return

L1:     li   a5, 1          # otherwise, result is 1
        addi sp, sp,8      #   pop 2 items from stack
        jr   ra             #   and return

L0:     li   a5, 0
        addi sp, sp,8
        jr   ra
        .globl  main
        .type   main,@function
main:
        li      t2,20
        li      tp,0
        li      a0,0
        li      a5,0
        li      a5,8
        mul     t5,t5,t2

L2:
        add     sp,sp,-4
        sw      ra,0(sp)        # save the return address
        add     a1,a0,0
        jal     ra,fib
        add     a2,a5,0        # result of fact becomes b input to printf
        lui     a0,%hi(.LC0)    # most sig 16b of s argument to printf(s, a, b)
        add     a0,a0,%lo(.LC0) # least sig 16b of s argument to printf
        call    printf          # call printf, arguments are in a0, a1, a2
        li      a0,0            # return a 0
        lw      ra,0(sp)        # restore ra
        add     sp,sp,4         # pop stack
        add     tp,tp,1
        add     a0,a0,tp
        bne     t2,tp,L2
        jal     ra,END
END:    jr      ra
.LC0:
        .string "fib(%d)=%d\n"
