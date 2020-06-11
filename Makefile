BUILD = build
SRC = src
SIMULATOR = qemu-system-i386
SIMULATOR_FLAGS = -fda
SIMULATOR_DEBUG_FLAGS = -s -S -fda
GCC_FLAGS = -g -ffreestanding -m32 -fno-pie

all: run

prepare:
	mkdir -p $(BUILD)

kernel_entry.o:
	nasm $(SRC)/boot/kernel_entry.asm -f elf32 -o $(BUILD)/kernel_entry.o
	
kernel.o:
	gcc $(GCC_FLAGS) -c $(SRC)/kernel/kernel.c -o $(BUILD)/kernel.o
	
kernel.bin: kernel.o kernel_entry.o
	ld -o $(BUILD)/kernel.bin -m elf_i386 -Ttext 0x1000 $(BUILD)/kernel_entry.o $(BUILD)/kernel.o --oformat binary

kernel.elf: kernel.o kernel_entry.o
	ld -o $(BUILD)/kernel.elf -m elf_i386 -Ttext 0x1000 $(BUILD)/kernel_entry.o $(BUILD)/kernel.o

simple_boot_sector.bin:
	nasm -f bin $(SRC)/simple_boot_sector.asm -o $(BUILD)/simple_boot_sector.bin

os-image.bin: simple_boot_sector.bin kernel.bin
	cat $(BUILD)/simple_boot_sector.bin $(BUILD)/kernel.bin > $(BUILD)/os-image

run: prepare os-image.bin
	$(SIMULATOR) $(SIMULATOR_FLAGS) $(BUILD)/os-image

debug: prepare os-image.bin kernel.elf
	$(SIMULATOR) $(SIMULATOR_DEBUG_FLAGS) $(BUILD)/os-image
	#(gdb) target remote :1234
	#(gdb) file build/kernel.elf
	# x /s (0xf00000000b8000)
