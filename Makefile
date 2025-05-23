SWIFT_TOOLCHAIN := ~/.swiftly/bin
SWIFT := $(SWIFT_TOOLCHAIN)/swift
CLANG := $(SWIFT_TOOLCHAIN)/clang
STM32_Programmer_CLI = ~/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin/STM32_Programmer_CLI

TARGET := armv7em-none-none-eabi
TOOLSET := toolset.json

.PHONY: build
build:
	@echo "building..."
	$(SWIFT) build \
	    --configuration release \
		--triple $(TARGET) \
		--toolset $(TOOLSET) \
		--verbose

	mv .build/release/Application .build/release/Application.elf

.PHONY: flash
flash:
	@echo "flashing..."
	$(STM32_Programmer_CLI) -c port=SWD -d .build/release/Application.elf -s

.PHONY: run
run: build flash

.PHONY: clean
clean:
	@echo "cleaning..."
	@$(SWIFT) package clean
