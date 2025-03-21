// Generated by svd2swift.

import MMIO

/// Flexible memory controller
@RegisterBlock
public struct FMC {
    /// SRAM/NOR-Flash chip-select control register 1
    @RegisterBlock(offset: 0x0)
    public var bcr1: Register<BCR1>

    /// SRAM/NOR-Flash chip-select timing register 1
    @RegisterBlock(offset: 0x4)
    public var btr1: Register<BTR1>

    /// SRAM/NOR-Flash chip-select control register 2
    @RegisterBlock(offset: 0x8)
    public var bcr2: Register<BCR2>

    /// SRAM/NOR-Flash chip-select timing register 2
    @RegisterBlock(offset: 0xc)
    public var btr2: Register<BTR2>

    /// SRAM/NOR-Flash chip-select control register 3
    @RegisterBlock(offset: 0x10)
    public var bcr3: Register<BCR3>

    /// SRAM/NOR-Flash chip-select timing register 3
    @RegisterBlock(offset: 0x14)
    public var btr3: Register<BTR3>

    /// SRAM/NOR-Flash chip-select control register 4
    @RegisterBlock(offset: 0x18)
    public var bcr4: Register<BCR4>

    /// SRAM/NOR-Flash chip-select timing register 4
    @RegisterBlock(offset: 0x1c)
    public var btr4: Register<BTR4>

    /// PC Card/NAND Flash control register
    @RegisterBlock(offset: 0x80)
    public var pcr: Register<PCR>

    /// FIFO status and interrupt register
    @RegisterBlock(offset: 0x84)
    public var sr: Register<SR>

    /// Common memory space timing register
    @RegisterBlock(offset: 0x88)
    public var pmem: Register<PMEM>

    /// Attribute memory space timing register
    @RegisterBlock(offset: 0x8c)
    public var patt: Register<PATT>

    /// ECC result register
    @RegisterBlock(offset: 0x94)
    public var eccr: Register<ECCR>

    /// SRAM/NOR-Flash write timing registers 1
    @RegisterBlock(offset: 0x104)
    public var bwtr1: Register<BWTR1>

    /// SRAM/NOR-Flash write timing registers 2
    @RegisterBlock(offset: 0x10c)
    public var bwtr2: Register<BWTR2>

    /// SRAM/NOR-Flash write timing registers 3
    @RegisterBlock(offset: 0x114)
    public var bwtr3: Register<BWTR3>

    /// SRAM/NOR-Flash write timing registers 4
    @RegisterBlock(offset: 0x11c)
    public var bwtr4: Register<BWTR4>

    /// SDRAM Control Register 1
    @RegisterBlock(offset: 0x140)
    public var sdcr1: Register<SDCR1>

    /// SDRAM Control Register 2
    @RegisterBlock(offset: 0x144)
    public var sdcr2: Register<SDCR2>

    /// SDRAM Timing register 1
    @RegisterBlock(offset: 0x148)
    public var sdtr1: Register<SDTR1>

    /// SDRAM Timing register 2
    @RegisterBlock(offset: 0x14c)
    public var sdtr2: Register<SDTR2>

    /// SDRAM Command Mode register
    @RegisterBlock(offset: 0x150)
    public var sdcmr: Register<SDCMR>

    /// SDRAM Refresh Timer register
    @RegisterBlock(offset: 0x154)
    public var sdrtr: Register<SDRTR>

    /// SDRAM Status register
    @RegisterBlock(offset: 0x158)
    public var sdsr: Register<SDSR>
}

extension FMC {
    /// SRAM/NOR-Flash chip-select control register 1
    @Register(bitWidth: 32)
    public struct BCR1 {
        /// CCLKEN
        @ReadWrite(bits: 20..<21)
        public var cclken: CCLKEN

        /// CBURSTRW
        @ReadWrite(bits: 19..<20)
        public var cburstrw: CBURSTRW

        /// ASYNCWAIT
        @ReadWrite(bits: 15..<16)
        public var asyncwait: ASYNCWAIT

        /// EXTMOD
        @ReadWrite(bits: 14..<15)
        public var extmod: EXTMOD

        /// WAITEN
        @ReadWrite(bits: 13..<14)
        public var waiten: WAITEN

        /// WREN
        @ReadWrite(bits: 12..<13)
        public var wren: WREN

        /// WAITCFG
        @ReadWrite(bits: 11..<12)
        public var waitcfg: WAITCFG

        /// WAITPOL
        @ReadWrite(bits: 9..<10)
        public var waitpol: WAITPOL

        /// BURSTEN
        @ReadWrite(bits: 8..<9)
        public var bursten: BURSTEN

        /// FACCEN
        @ReadWrite(bits: 6..<7)
        public var faccen: FACCEN

        /// MWID
        @ReadWrite(bits: 4..<6)
        public var mwid: MWID

        /// MTYP
        @ReadWrite(bits: 2..<4)
        public var mtyp: MTYP

        /// MUXEN
        @ReadWrite(bits: 1..<2)
        public var muxen: MUXEN

        /// MBKEN
        @ReadWrite(bits: 0..<1)
        public var mbken: MBKEN
    }

    /// SRAM/NOR-Flash chip-select timing register 1
    @Register(bitWidth: 32)
    public struct BTR1 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// BUSTURN
        @ReadWrite(bits: 16..<20)
        public var busturn: BUSTURN

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// SRAM/NOR-Flash chip-select control register 2
    @Register(bitWidth: 32)
    public struct BCR2 {
        /// CBURSTRW
        @ReadWrite(bits: 19..<20)
        public var cburstrw: CBURSTRW

        /// ASYNCWAIT
        @ReadWrite(bits: 15..<16)
        public var asyncwait: ASYNCWAIT

        /// EXTMOD
        @ReadWrite(bits: 14..<15)
        public var extmod: EXTMOD

        /// WAITEN
        @ReadWrite(bits: 13..<14)
        public var waiten: WAITEN

        /// WREN
        @ReadWrite(bits: 12..<13)
        public var wren: WREN

        /// WAITCFG
        @ReadWrite(bits: 11..<12)
        public var waitcfg: WAITCFG

        /// WRAPMOD
        @ReadWrite(bits: 10..<11)
        public var wrapmod: WRAPMOD

        /// WAITPOL
        @ReadWrite(bits: 9..<10)
        public var waitpol: WAITPOL

        /// BURSTEN
        @ReadWrite(bits: 8..<9)
        public var bursten: BURSTEN

        /// FACCEN
        @ReadWrite(bits: 6..<7)
        public var faccen: FACCEN

        /// MWID
        @ReadWrite(bits: 4..<6)
        public var mwid: MWID

        /// MTYP
        @ReadWrite(bits: 2..<4)
        public var mtyp: MTYP

        /// MUXEN
        @ReadWrite(bits: 1..<2)
        public var muxen: MUXEN

        /// MBKEN
        @ReadWrite(bits: 0..<1)
        public var mbken: MBKEN
    }

    /// SRAM/NOR-Flash chip-select timing register 2
    @Register(bitWidth: 32)
    public struct BTR2 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// BUSTURN
        @ReadWrite(bits: 16..<20)
        public var busturn: BUSTURN

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// SRAM/NOR-Flash chip-select control register 3
    @Register(bitWidth: 32)
    public struct BCR3 {
        /// CBURSTRW
        @ReadWrite(bits: 19..<20)
        public var cburstrw: CBURSTRW

        /// ASYNCWAIT
        @ReadWrite(bits: 15..<16)
        public var asyncwait: ASYNCWAIT

        /// EXTMOD
        @ReadWrite(bits: 14..<15)
        public var extmod: EXTMOD

        /// WAITEN
        @ReadWrite(bits: 13..<14)
        public var waiten: WAITEN

        /// WREN
        @ReadWrite(bits: 12..<13)
        public var wren: WREN

        /// WAITCFG
        @ReadWrite(bits: 11..<12)
        public var waitcfg: WAITCFG

        /// WRAPMOD
        @ReadWrite(bits: 10..<11)
        public var wrapmod: WRAPMOD

        /// WAITPOL
        @ReadWrite(bits: 9..<10)
        public var waitpol: WAITPOL

        /// BURSTEN
        @ReadWrite(bits: 8..<9)
        public var bursten: BURSTEN

        /// FACCEN
        @ReadWrite(bits: 6..<7)
        public var faccen: FACCEN

        /// MWID
        @ReadWrite(bits: 4..<6)
        public var mwid: MWID

        /// MTYP
        @ReadWrite(bits: 2..<4)
        public var mtyp: MTYP

        /// MUXEN
        @ReadWrite(bits: 1..<2)
        public var muxen: MUXEN

        /// MBKEN
        @ReadWrite(bits: 0..<1)
        public var mbken: MBKEN
    }

    /// SRAM/NOR-Flash chip-select timing register 3
    @Register(bitWidth: 32)
    public struct BTR3 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// BUSTURN
        @ReadWrite(bits: 16..<20)
        public var busturn: BUSTURN

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// SRAM/NOR-Flash chip-select control register 4
    @Register(bitWidth: 32)
    public struct BCR4 {
        /// CBURSTRW
        @ReadWrite(bits: 19..<20)
        public var cburstrw: CBURSTRW

        /// ASYNCWAIT
        @ReadWrite(bits: 15..<16)
        public var asyncwait: ASYNCWAIT

        /// EXTMOD
        @ReadWrite(bits: 14..<15)
        public var extmod: EXTMOD

        /// WAITEN
        @ReadWrite(bits: 13..<14)
        public var waiten: WAITEN

        /// WREN
        @ReadWrite(bits: 12..<13)
        public var wren: WREN

        /// WAITCFG
        @ReadWrite(bits: 11..<12)
        public var waitcfg: WAITCFG

        /// WRAPMOD
        @ReadWrite(bits: 10..<11)
        public var wrapmod: WRAPMOD

        /// WAITPOL
        @ReadWrite(bits: 9..<10)
        public var waitpol: WAITPOL

        /// BURSTEN
        @ReadWrite(bits: 8..<9)
        public var bursten: BURSTEN

        /// FACCEN
        @ReadWrite(bits: 6..<7)
        public var faccen: FACCEN

        /// MWID
        @ReadWrite(bits: 4..<6)
        public var mwid: MWID

        /// MTYP
        @ReadWrite(bits: 2..<4)
        public var mtyp: MTYP

        /// MUXEN
        @ReadWrite(bits: 1..<2)
        public var muxen: MUXEN

        /// MBKEN
        @ReadWrite(bits: 0..<1)
        public var mbken: MBKEN
    }

    /// SRAM/NOR-Flash chip-select timing register 4
    @Register(bitWidth: 32)
    public struct BTR4 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// BUSTURN
        @ReadWrite(bits: 16..<20)
        public var busturn: BUSTURN

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// PC Card/NAND Flash control register
    @Register(bitWidth: 32)
    public struct PCR {
        /// ECCPS
        @ReadWrite(bits: 17..<20)
        public var eccps: ECCPS

        /// TAR
        @ReadWrite(bits: 13..<17)
        public var tar: TAR

        /// TCLR
        @ReadWrite(bits: 9..<13)
        public var tclr: TCLR

        /// ECCEN
        @ReadWrite(bits: 6..<7)
        public var eccen: ECCEN

        /// PWID
        @ReadWrite(bits: 4..<6)
        public var pwid: PWID

        /// PTYP
        @ReadWrite(bits: 3..<4)
        public var ptyp: PTYP

        /// PBKEN
        @ReadWrite(bits: 2..<3)
        public var pbken: PBKEN

        /// PWAITEN
        @ReadWrite(bits: 1..<2)
        public var pwaiten: PWAITEN
    }

    /// FIFO status and interrupt register
    @Register(bitWidth: 32)
    public struct SR {
        /// FEMPT
        @ReadOnly(bits: 6..<7)
        public var fempt: FEMPT

        /// IFEN
        @ReadWrite(bits: 5..<6)
        public var ifen: IFEN

        /// ILEN
        @ReadWrite(bits: 4..<5)
        public var ilen: ILEN

        /// IREN
        @ReadWrite(bits: 3..<4)
        public var iren: IREN

        /// IFS
        @ReadWrite(bits: 2..<3)
        public var ifs: IFS

        /// ILS
        @ReadWrite(bits: 1..<2)
        public var ils: ILS

        /// IRS
        @ReadWrite(bits: 0..<1)
        public var irs: IRS
    }

    /// Common memory space timing register
    @Register(bitWidth: 32)
    public struct PMEM {
        /// MEMHIZx
        @ReadWrite(bits: 24..<32)
        public var memhizx: MEMHIZx

        /// MEMHOLDx
        @ReadWrite(bits: 16..<24)
        public var memholdx: MEMHOLDx

        /// MEMWAITx
        @ReadWrite(bits: 8..<16)
        public var memwaitx: MEMWAITx

        /// MEMSETx
        @ReadWrite(bits: 0..<8)
        public var memsetx: MEMSETx
    }

    /// Attribute memory space timing register
    @Register(bitWidth: 32)
    public struct PATT {
        /// ATTHIZx
        @ReadWrite(bits: 24..<32)
        public var atthizx: ATTHIZx

        /// ATTHOLDx
        @ReadWrite(bits: 16..<24)
        public var attholdx: ATTHOLDx

        /// ATTWAITx
        @ReadWrite(bits: 8..<16)
        public var attwaitx: ATTWAITx

        /// ATTSETx
        @ReadWrite(bits: 0..<8)
        public var attsetx: ATTSETx
    }

    /// ECC result register
    @Register(bitWidth: 32)
    public struct ECCR {
        /// ECCx
        @ReadOnly(bits: 0..<32)
        public var eccx: ECCx
    }

    /// SRAM/NOR-Flash write timing registers 1
    @Register(bitWidth: 32)
    public struct BWTR1 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// SRAM/NOR-Flash write timing registers 2
    @Register(bitWidth: 32)
    public struct BWTR2 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// SRAM/NOR-Flash write timing registers 3
    @Register(bitWidth: 32)
    public struct BWTR3 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// SRAM/NOR-Flash write timing registers 4
    @Register(bitWidth: 32)
    public struct BWTR4 {
        /// ACCMOD
        @ReadWrite(bits: 28..<30)
        public var accmod: ACCMOD

        /// DATLAT
        @ReadWrite(bits: 24..<28)
        public var datlat: DATLAT

        /// CLKDIV
        @ReadWrite(bits: 20..<24)
        public var clkdiv: CLKDIV

        /// DATAST
        @ReadWrite(bits: 8..<16)
        public var datast: DATAST

        /// ADDHLD
        @ReadWrite(bits: 4..<8)
        public var addhld: ADDHLD

        /// ADDSET
        @ReadWrite(bits: 0..<4)
        public var addset: ADDSET
    }

    /// SDRAM Control Register 1
    @Register(bitWidth: 32)
    public struct SDCR1 {
        /// Number of column address bits
        @ReadWrite(bits: 0..<2)
        public var nc: NC

        /// Number of row address bits
        @ReadWrite(bits: 2..<4)
        public var nr: NR

        /// Memory data bus width
        @ReadWrite(bits: 4..<6)
        public var mwid: MWID

        /// Number of internal banks
        @ReadWrite(bits: 6..<7)
        public var nb: NB

        /// CAS latency
        @ReadWrite(bits: 7..<9)
        public var cas: CAS

        /// Write protection
        @ReadWrite(bits: 9..<10)
        public var wp: WP

        /// SDRAM clock configuration
        @ReadWrite(bits: 10..<12)
        public var sdclk: SDCLK

        /// Burst read
        @ReadWrite(bits: 12..<13)
        public var rburst: RBURST

        /// Read pipe
        @ReadWrite(bits: 13..<15)
        public var rpipe: RPIPE
    }

    /// SDRAM Control Register 2
    @Register(bitWidth: 32)
    public struct SDCR2 {
        /// Number of column address bits
        @ReadWrite(bits: 0..<2)
        public var nc: NC

        /// Number of row address bits
        @ReadWrite(bits: 2..<4)
        public var nr: NR

        /// Memory data bus width
        @ReadWrite(bits: 4..<6)
        public var mwid: MWID

        /// Number of internal banks
        @ReadWrite(bits: 6..<7)
        public var nb: NB

        /// CAS latency
        @ReadWrite(bits: 7..<9)
        public var cas: CAS

        /// Write protection
        @ReadWrite(bits: 9..<10)
        public var wp: WP

        /// SDRAM clock configuration
        @ReadWrite(bits: 10..<12)
        public var sdclk: SDCLK

        /// Burst read
        @ReadWrite(bits: 12..<13)
        public var rburst: RBURST

        /// Read pipe
        @ReadWrite(bits: 13..<15)
        public var rpipe: RPIPE
    }

    /// SDRAM Timing register 1
    @Register(bitWidth: 32)
    public struct SDTR1 {
        /// Load Mode Register to Active
        @ReadWrite(bits: 0..<4)
        public var tmrd: TMRD

        /// Exit self-refresh delay
        @ReadWrite(bits: 4..<8)
        public var txsr: TXSR

        /// Self refresh time
        @ReadWrite(bits: 8..<12)
        public var tras: TRAS

        /// Row cycle delay
        @ReadWrite(bits: 12..<16)
        public var trc: TRC

        /// Recovery delay
        @ReadWrite(bits: 16..<20)
        public var twr: TWR

        /// Row precharge delay
        @ReadWrite(bits: 20..<24)
        public var trp: TRP

        /// Row to column delay
        @ReadWrite(bits: 24..<28)
        public var trcd: TRCD
    }

    /// SDRAM Timing register 2
    @Register(bitWidth: 32)
    public struct SDTR2 {
        /// Load Mode Register to Active
        @ReadWrite(bits: 0..<4)
        public var tmrd: TMRD

        /// Exit self-refresh delay
        @ReadWrite(bits: 4..<8)
        public var txsr: TXSR

        /// Self refresh time
        @ReadWrite(bits: 8..<12)
        public var tras: TRAS

        /// Row cycle delay
        @ReadWrite(bits: 12..<16)
        public var trc: TRC

        /// Recovery delay
        @ReadWrite(bits: 16..<20)
        public var twr: TWR

        /// Row precharge delay
        @ReadWrite(bits: 20..<24)
        public var trp: TRP

        /// Row to column delay
        @ReadWrite(bits: 24..<28)
        public var trcd: TRCD
    }

    /// SDRAM Command Mode register
    @Register(bitWidth: 32)
    public struct SDCMR {
        /// Command mode
        @WriteOnly(bits: 0..<3)
        public var mode: MODE

        /// Command target bank 2
        @WriteOnly(bits: 3..<4)
        public var ctb2: CTB2

        /// Command target bank 1
        @WriteOnly(bits: 4..<5)
        public var ctb1: CTB1

        /// Number of Auto-refresh
        @ReadWrite(bits: 5..<9)
        public var nrfs: NRFS

        /// Mode Register definition
        @ReadWrite(bits: 9..<22)
        public var mrd: MRD
    }

    /// SDRAM Refresh Timer register
    @Register(bitWidth: 32)
    public struct SDRTR {
        /// Clear Refresh error flag
        @WriteOnly(bits: 0..<1)
        public var cre: CRE

        /// Refresh Timer Count
        @ReadWrite(bits: 1..<14)
        public var count: COUNT

        /// RES Interrupt Enable
        @ReadWrite(bits: 14..<15)
        public var reie: REIE
    }

    /// SDRAM Status register
    @Register(bitWidth: 32)
    public struct SDSR {
        /// Refresh error flag
        @ReadOnly(bits: 0..<1)
        public var re: RE

        /// Status Mode for Bank 1
        @ReadOnly(bits: 1..<3)
        public var modes1: MODES1

        /// Status Mode for Bank 2
        @ReadOnly(bits: 3..<5)
        public var modes2: MODES2

        /// Busy status
        @ReadOnly(bits: 5..<6)
        public var busy: BUSY
    }
}
