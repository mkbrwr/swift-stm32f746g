MEMORY
{
   flash  : ORIGIN = 0x08000000, LENGTH = 1024K
   sram   : ORIGIN = 0x20000000, LENGTH = 320K
}

SECTIONS
{
   .text     : { *(.vectors*) ; *(.text*) } > flash
   .bss      : { *(.bss*) } > sram
   .data     : { *(.data*) } > sram
   /DISCARD/ : { *(.swift_modhash*) }
}
