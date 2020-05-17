BUILD = build
SRC = src
SIMULATOR = qemu-system-x86_64

all: run

prepare:
	mkdir -p $(BUILD)

build: prepare
	nasm -f bin $(SRC)/simple_boot_sector.asm -o $(BUILD)/simple_boot_sector.bin

run: build
	$(SIMULATOR) $(BUILD)/simple_boot_sector.bin
