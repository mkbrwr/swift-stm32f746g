SWIFT_TOOLCHAIN := ~/.swiftly/bin
SWIFT := $(SWIFT_TOOLCHAIN)/swift
CLANG := $(SWIFT_TOOLCHAIN)/clang
STM32_Programmer_CLI = ~/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin/STM32_Programmer_CLI

TARGET := armv7em-none-none-eabi
TOOLSET := toolset.json

.PHONY: build
build:
	@echo "compiling..."
	$(SWIFT) build \
	    --configuration release \
		--triple $(TARGET) \
		--toolset $(TOOLSET) \
		--verbose

	@echo "linking..."
		$(CLANG) -v -target $(TARGET) -fuse-ld=lld -nostdlib -static \
        -Wl,-e,vector_table -Wl,--gc-sections -Wl,-T,Sources/Support/linkerscript.ld \
        .build/release/libApplication.a \
        -o a.elf

.PHONY: flash
flash:
	@echo "flashing..."
	$(STM32_Programmer_CLI) -c port=SWD -d a.elf -s

.PHONY: run
run: build flash

.PHONY: clean
clean:
	@echo "cleaning..."
	@$(SWIFT) package clean
	@rm -f a.elf
