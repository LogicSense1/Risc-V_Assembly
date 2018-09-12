CC=	riscv32-unknown-elf-gcc 
AS=	riscv32-unknown-elf-as 
ASFLAGS=	 -march=rv32im -mabi=ilp32
CFLAGS=	-O2  -march=rv32im -mabi=ilp32
OBJS=	helloworld.o 
LDFLAGS= -lc -lgcc

fact:	$(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o fact $(LDFLAGS)

run:	helloworld
	spike ~/riscv32/riscv64-unknown-elf/bin/pk  helloworld

clean:
	-rm -f *.o helloworld.riscv helloworld.riscv.hex helloworld.riscv.dump 
