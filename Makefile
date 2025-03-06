# Swift toolchain paths
SWIFT_TOOLCHAIN := ~/Developer/swift-6.1-DEVELOPMENT-SNAPSHOT-2025-03-03-a-debian12/usr/bin
SWIFT := $(SWIFT_TOOLCHAIN)/swift
SWIFTC := $(SWIFT_TOOLCHAIN)/swiftc
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

	$(CLANG) -target $(TARGET) -c Support/Startup.c -o .build/Startup.o

	$(CLANG) -target $(TARGET) -c Support/Support.c -o .build/Support.o

	# $(SWIFTC) -target $(TARGET) \
	# 	-wmo -enable-experimental-feature Embedded -disable-stack-protector -parse-as-library \
	# 	-c Support/SingleCoreAllocator.swift \
	# 	-o .build/SingleCoreAllocator.o \

	@echo "linking..."
	$(CLANG) -v -target $(TARGET) -fuse-ld=lld -nostdlib -static \
    -Wl,-e,vector_table -Wl,--gc-sections -Wl,-T,linkerscript.ld \
	.build/Startup.o \
	.build/Support.o \
    .build/release/libApplication.a \
    -o a.elf || exit 1

.PHONY: clean
clean:
	@echo "cleaning..."
	@$(SWIFT) package clean
	@rm a.elf
	@rm -rf .build
