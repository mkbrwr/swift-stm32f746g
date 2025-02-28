# Swift toolchain paths
SWIFT_TOOLCHAIN := ~/Developer/swift-6.1-DEVELOPMENT-SNAPSHOT-2025-02-21-a-debian12/usr/bin
SWIFT := $(SWIFT_TOOLCHAIN)/swift
CLANG := $(SWIFT_TOOLCHAIN)/clang

# Setup tools and build flags
ARCH := armv7em
TARGET := $(ARCH)-none-none-eabi

.PHONY: build
build:
	@echo "compiling..."
	$(SWIFT) build \
		--configuration release \
		--verbose \
		--triple $(TARGET) \
		-Xcc -ffreestanding \
		-Xswiftc -Xfrontend -Xswiftc -disable-stack-protector

	@echo "linking..."
	$(CLANG) -v -target $(TARGET) -fuse-ld=lld -nostdlib -static \
    -Wl,-e,vector_table -Wl,--gc-sections -Wl,-T,linkerscript.ld \
    .build/release/libApplication.a \
    -o a.elf || exit 1

.PHONY: clean
clean:
	@echo "cleaning..."
	@$(SWIFT) package clean
	@rm a.elf
	@rm -rf .build
