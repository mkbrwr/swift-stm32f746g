#include <stdint.h>

static inline void nop() {
    asm volatile("nop");
}

static inline void delay(uint32_t i) {
    __asm__ volatile(
        "   .align 2 \n"
        "1:     subs    %0, #1\n"
        "       bhi     1b\n"
        : "=r"(i)
        : "0" (i)
        : "cc"
        );
}

__attribute((used))
static uint32_t log2_exact(uint32_t value) {
    if ((value == 0) || (__builtin_popcount(value) != 1)) {
        while (1) {};
    }
    return 31U - __builtin_clz(value);
}
