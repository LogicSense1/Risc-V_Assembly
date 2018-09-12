	.text
	.align  2
	.globl  main
	.type   main, @function
main:
        li      t2,10
        li      tp,0
L2:
        add     sp,sp,-4
        sw      ra,0(sp)        # save the return address
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
        .string "hello world!\n"
