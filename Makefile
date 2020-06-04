BUILD = build
SRC = src
SIMULATOR = qemu-system-x86_64
SIMULATOR_FLAGS = -fda

all: run

kernel: build
	gcc -ffreestanding -c $(SRC)/kernel/kernel.c -o $(BUILD)/kernel.o
	ld -o $(BUILD)/kernel.bin -Ttext 0x1000 $(BUILD)/kernel.o --oformat binary
	cat $(BUILD)/simple_boot_sector.bin $(BUILD)/kernel.bin > $(BUILD)/os-image

prepare:
	mkdir -p $(BUILD)

build: prepare
	nasm -f bin $(SRC)/simple_boot_sector.asm -o $(BUILD)/simple_boot_sector.bin

run: kernel
	$(SIMULATOR) $(SIMULATOR_FLAGS) $(BUILD)/os-image
