BUILD = build
SRC = src
SIMULATOR = qemu-system-x86_64

all: build run

prepare:
	mkdir -p $(BUILD)

build:
	nasm -f bin $(SRC)/simple_boot_sector.asm -o $(BUILD)/simple_boot_sector.bin

run:
	$(SIMULATOR) $(BUILD)/simple_boot_sector.bin
