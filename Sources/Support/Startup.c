extern int main(int argc, char *argv[]);

void reset(void) {
    main(0, 0);
    while (1) {}
}

void interrupt(void) {
    while (1) {}
}

__attribute((used, section(".vectors")))
void *vector_table[114] = {
    (void *)0x2000FFFF, // end of DTCM, stack grows down
    reset, // Reset

    interrupt, // NMI
    interrupt, // HardFault
    interrupt, // MemManage
    interrupt, // BusFault
    interrupt, // UsageFault

    0 // NULL for all the other handlers
};
