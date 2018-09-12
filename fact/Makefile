CC=	riscv32-unknown-elf-gcc 
AS=	riscv32-unknown-elf-as 
ASFLAGS=	 -march=rv32im -mabi=ilp32
CFLAGS=	-O2  -march=rv32im -mabi=ilp32
OBJS=	fact.o 
LDFLAGS= -lc -lgcc

fact:	$(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o fact $(LDFLAGS)

run:	fact
	spike ~/riscv32/riscv64-unknown-elf/bin/pk  fact

clean:
	-rm -f *.o fact.riscv fact.riscv.hex fact.riscv.dump 
