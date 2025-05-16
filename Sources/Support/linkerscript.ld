MEMORY
{
   flash  : ORIGIN = 0x08000000, LENGTH = 1024K
   sram1  : ORIGIN = 0x20010000, LENGTH = 240K
   sram2  : ORIGIN = 0x2004C000, LENGTH = 16K
}

SECTIONS
{
   .text     : { *(.vectors*) ; *(.text*) } > flash
   .bss      : { *(.bss*) } > sram2
   .data     : { *(.data*) } > sram2
   /DISCARD/ : { *(.swift_modhash*) }
}
