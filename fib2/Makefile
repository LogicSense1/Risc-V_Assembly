CC=	riscv32-unknown-elf-gcc 
AS=	riscv32-unknown-elf-as 
ASFLAGS=	 -march=rv32im -mabi=ilp32
CFLAGS=	-O2  -march=rv32im -mabi=ilp32
OBJS=	fib.o 
LDFLAGS= -lc -lgcc

fact:	$(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o fact $(LDFLAGS)

run:	fib
	spike ~/riscv32/riscv64-unknown-elf/bin/pk  fib

clean:
	-rm -f *.o fib.riscv fib.riscv.hex fib.riscv.dump 
