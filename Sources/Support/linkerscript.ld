MEMORY
{
   flash  : ORIGIN = 0x08000000, LENGTH = 1024K
   sram1a : ORIGIN = 0x20010000, LENGTH = 204K
   sram1b : ORIGIN = 0x20043000, LENGTH = 36K
}

SECTIONS
{
   .text     : { *(.vectors*) ; *(.text*) } > flash
   .rodata   : { *(.rodata*) ; *(.got*) } > flash
   .bss      : { *(.bss*) } > sram1b
   .data     : { *(.data*) } > sram1b
   /DISCARD/ : { *(.swift_modhash*) }

   /* ARM metadata sections */
   /DISCARD/ : { *(.ARM.attributes*) *(.ARM.exidx) }

   /* ELF metadata sections */
   .symtab   : { *(.symtab) }
   .strtab   : { *(.strtab) }
   .shstrtab : { *(.shstrtab) }
   .debug    : { *(.debug*) }
   .comment  : { *(.comment) }
}
