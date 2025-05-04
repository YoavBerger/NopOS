all: run

kernel.bin: kernel_entry.o kernel.o
	# Link the object files into an ELF executable (temporary file)
	ld -m i386pe -o kernel.elf -Ttext 0x1000 -e _start kernel_entry.o kernel.o
	# Convert the ELF file to a raw binary file
	objcopy -O binary kernel.elf kernel.bin

kernel_entry.o: kernel_entry.asm
	nasm -f elf32 $< -o $@

kernel.o: kernel.c
	# Compile C code without standard libraries and startup files
	gcc -m32 -ffreestanding -nostartfiles -nodefaultlibs -c $< -o $@

boot.bin: boot.asm
	nasm -f bin $< -o $@

os-image.bin: boot.bin kernel.bin
	copy /b $^ $@

run: os-image.bin
	qemu-system-i386 -fda $<

clean:
	del /Q *.bin *.o *.dis *.elf
