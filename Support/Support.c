#include <stdint.h>
#include <stddef.h>

void __aeabi_memclr(void *dest, size_t n) {
    unsigned char *pdest = (unsigned char *)dest;
    while (n--) {
        *pdest++ = 0;
    }
}

void* __aeabi_memmove(void* dest, const void* src, size_t n)
{
    unsigned char *p = dest;
    const unsigned char *q = src;
    if (dest <= src)
        while (n-- > 0) *p++ = *q++;
    else {
        p += n; q += n;
        while (n-- > 0) *--p = *--q;
    }
    return dest;
}

int putchar(int c) {
    return c;
}

#define HEAP_SIZE (256 * 1024)
__attribute((used, section(".data")))
static uint8_t heap[HEAP_SIZE];
static size_t heap_used = 0;


void free(void *ptr) {
    // never free
    (void)ptr;
}

int posix_memalign(void **memptr, size_t alignment, size_t size) {
    // Check if alignment is a power of 2 and at least sizeof(void*)
    if ((alignment & (alignment - 1)) != 0 || alignment < sizeof(void*)) {
        return 22; // EINVAL
    }

    // Calculate aligned address
    size_t padding = alignment - ((uintptr_t)&heap[heap_used] % alignment);
    if (padding == alignment) {
        padding = 0;
    }

    // Check if we have enough space
    if (heap_used + padding + size > HEAP_SIZE) {
        return 12; // ENOMEM
    }

    // Allocate memory
    heap_used += padding;
    *memptr = &heap[heap_used];
    heap_used += size;

    return 0;
}
