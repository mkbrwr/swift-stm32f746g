//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

#include <stdint.h>
#include <stddef.h>

extern int main(int argc, char *argv[]);

void reset(void) {
    main(0, NULL);
}

void interrupt(void) {
    while (1) {}
}

__attribute((used, section(".vectors")))
void *vector_table[114] = {
    (void *)0x20050000,
    reset, // Reset

    interrupt, // NMI
    interrupt, // HardFault
    interrupt, // MemManage
    interrupt, // BusFault
    interrupt, // UsageFault

    0 // NULL for all the other handlers
};
