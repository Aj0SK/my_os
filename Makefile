BUILD = build
SRC = src
SIMULATOR = qemu-system-x86_64

all: run_samples

prepare:
	mkdir -p $(BUILD)

run_samples: build_samples run_sample1

build_samples: sample1

run_sample1:
	$(SIMULATOR) $(BUILD)/simple_boot_sector.bin

sample1:
	nasm -f bin $(SRC)/sample1/simple_boot_sector.asm -o $(BUILD)/simple_boot_sector.bin
