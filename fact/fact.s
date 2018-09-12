        .text
        .globl  fact
        .type   fact, @function
fact:
        addi sp, sp, -8     # adjust stack for 2 items
        sw   ra, 4(sp)      # save return address
        sw   a0, 0(sp)      # save argument - this is a local variable allocated on the stack
        li   t0, 2          # put a 2 into t0
        bgeu a0, t0, L1     # if n >= 2 take jump
        li   a0, 1          # otherwise, result is 1
        addi sp, sp, 8      #   pop 2 items from stack
        jr   ra             #   and return
L1:     addi a0, a0, -1     # else decrement n
        jal  fact           # recursive call to get fact(n-1)
        lw   t0, 0(sp)      # restore original n
        mul  a0, t0, a0     # multiply to get result n * fact(n-1)
        lw   ra, 4(sp)      # restore return address
        addi sp, sp, 8      # pop 2 items from stack
        jr   ra             # and return
        .globl  main
        .type   main,@function
main:
        li      t2,11
        li      tp,0
        li      a0,0
L2:
        add     sp,sp,-4 
        sw      ra,0(sp)        # save the return address
        add     a1,a0,0
        jal     ra,fact
        add     a2,a0,0        # result of fact becomes b input to printf
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
        .string "fact(%d)=%d\n"
