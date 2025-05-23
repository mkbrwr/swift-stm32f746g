// Generated by svd2swift.

import MMIO

/// Universal synchronous asynchronous receiver transmitter
@RegisterBlock
public struct USART6 {
    /// Control register 1
    @RegisterBlock(offset: 0x0)
    public var cr1: Register<CR1>

    /// Control register 2
    @RegisterBlock(offset: 0x4)
    public var cr2: Register<CR2>

    /// Control register 3
    @RegisterBlock(offset: 0x8)
    public var cr3: Register<CR3>

    /// Baud rate register
    @RegisterBlock(offset: 0xc)
    public var brr: Register<BRR>

    /// Guard time and prescaler register
    @RegisterBlock(offset: 0x10)
    public var gtpr: Register<GTPR>

    /// Receiver timeout register
    @RegisterBlock(offset: 0x14)
    public var rtor: Register<RTOR>

    /// Request register
    @RegisterBlock(offset: 0x18)
    public var rqr: Register<RQR>

    /// Interrupt & status register
    @RegisterBlock(offset: 0x1c)
    public var isr: Register<ISR>

    /// Interrupt flag clear register
    @RegisterBlock(offset: 0x20)
    public var icr: Register<ICR>

    /// Receive data register
    @RegisterBlock(offset: 0x24)
    public var rdr: Register<RDR>

    /// Transmit data register
    @RegisterBlock(offset: 0x28)
    public var tdr: Register<TDR>
}

extension USART6 {
    /// Control register 1
    @Register(bitWidth: 32)
    public struct CR1 {
        /// Word length
        @ReadWrite(bits: 28..<29)
        public var m1: M1

        /// End of Block interrupt enable
        @ReadWrite(bits: 27..<28)
        public var eobie: EOBIE

        /// Receiver timeout interrupt enable
        @ReadWrite(bits: 26..<27)
        public var rtoie: RTOIE

        /// Driver Enable assertion time
        @ReadWrite(bits: 25..<26)
        public var deat4: DEAT4

        /// DEAT3
        @ReadWrite(bits: 24..<25)
        public var deat3: DEAT3

        /// DEAT2
        @ReadWrite(bits: 23..<24)
        public var deat2: DEAT2

        /// DEAT1
        @ReadWrite(bits: 22..<23)
        public var deat1: DEAT1

        /// DEAT0
        @ReadWrite(bits: 21..<22)
        public var deat0: DEAT0

        /// Driver Enable de-assertion time
        @ReadWrite(bits: 20..<21)
        public var dedt4: DEDT4

        /// DEDT3
        @ReadWrite(bits: 19..<20)
        public var dedt3: DEDT3

        /// DEDT2
        @ReadWrite(bits: 18..<19)
        public var dedt2: DEDT2

        /// DEDT1
        @ReadWrite(bits: 17..<18)
        public var dedt1: DEDT1

        /// DEDT0
        @ReadWrite(bits: 16..<17)
        public var dedt0: DEDT0

        /// Oversampling mode
        @ReadWrite(bits: 15..<16)
        public var over8: OVER8

        /// Character match interrupt enable
        @ReadWrite(bits: 14..<15)
        public var cmie: CMIE

        /// Mute mode enable
        @ReadWrite(bits: 13..<14)
        public var mme: MME

        /// Word length
        @ReadWrite(bits: 12..<13)
        public var m0: M0

        /// Receiver wakeup method
        @ReadWrite(bits: 11..<12)
        public var wake: WAKE

        /// Parity control enable
        @ReadWrite(bits: 10..<11)
        public var pce: PCE

        /// Parity selection
        @ReadWrite(bits: 9..<10)
        public var ps: PS

        /// PE interrupt enable
        @ReadWrite(bits: 8..<9)
        public var peie: PEIE

        /// interrupt enable
        @ReadWrite(bits: 7..<8)
        public var txeie: TXEIE

        /// Transmission complete interrupt enable
        @ReadWrite(bits: 6..<7)
        public var tcie: TCIE

        /// RXNE interrupt enable
        @ReadWrite(bits: 5..<6)
        public var rxneie: RXNEIE

        /// IDLE interrupt enable
        @ReadWrite(bits: 4..<5)
        public var idleie: IDLEIE

        /// Transmitter enable
        @ReadWrite(bits: 3..<4)
        public var te: TE

        /// Receiver enable
        @ReadWrite(bits: 2..<3)
        public var re: RE

        /// USART enable in Stop mode
        @ReadWrite(bits: 1..<2)
        public var uesm: UESM

        /// USART enable
        @ReadWrite(bits: 0..<1)
        public var ue: UE
    }

    /// Control register 2
    @Register(bitWidth: 32)
    public struct CR2 {
        /// Address of the USART node
        @ReadWrite(bits: 28..<32)
        public var add4_7: ADD4_7

        /// Address of the USART node
        @ReadWrite(bits: 24..<28)
        public var add0_3: ADD0_3

        /// Receiver timeout enable
        @ReadWrite(bits: 23..<24)
        public var rtoen: RTOEN

        /// Auto baud rate mode
        @ReadWrite(bits: 22..<23)
        public var abrmod1: ABRMOD1

        /// ABRMOD0
        @ReadWrite(bits: 21..<22)
        public var abrmod0: ABRMOD0

        /// Auto baud rate enable
        @ReadWrite(bits: 20..<21)
        public var abren: ABREN

        /// Most significant bit first
        @ReadWrite(bits: 19..<20)
        public var msbfirst: MSBFIRST

        /// Binary data inversion
        @ReadWrite(bits: 18..<19)
        public var tainv: TAINV

        /// TX pin active level inversion
        @ReadWrite(bits: 17..<18)
        public var txinv: TXINV

        /// RX pin active level inversion
        @ReadWrite(bits: 16..<17)
        public var rxinv: RXINV

        /// Swap TX/RX pins
        @ReadWrite(bits: 15..<16)
        public var swap: SWAP

        /// LIN mode enable
        @ReadWrite(bits: 14..<15)
        public var linen: LINEN

        /// STOP bits
        @ReadWrite(bits: 12..<14)
        public var stop: STOP

        /// Clock enable
        @ReadWrite(bits: 11..<12)
        public var clken: CLKEN

        /// Clock polarity
        @ReadWrite(bits: 10..<11)
        public var cpol: CPOL

        /// Clock phase
        @ReadWrite(bits: 9..<10)
        public var cpha: CPHA

        /// Last bit clock pulse
        @ReadWrite(bits: 8..<9)
        public var lbcl: LBCL

        /// LIN break detection interrupt enable
        @ReadWrite(bits: 6..<7)
        public var lbdie: LBDIE

        /// LIN break detection length
        @ReadWrite(bits: 5..<6)
        public var lbdl: LBDL

        /// 7-bit Address Detection/4-bit Address Detection
        @ReadWrite(bits: 4..<5)
        public var addm7: ADDM7
    }

    /// Control register 3
    @Register(bitWidth: 32)
    public struct CR3 {
        /// Wakeup from Stop mode interrupt enable
        @ReadWrite(bits: 22..<23)
        public var wufie: WUFIE

        /// Wakeup from Stop mode interrupt flag selection
        @ReadWrite(bits: 20..<22)
        public var wus: WUS

        /// Smartcard auto-retry count
        @ReadWrite(bits: 17..<20)
        public var scarcnt: SCARCNT

        /// Driver enable polarity selection
        @ReadWrite(bits: 15..<16)
        public var dep: DEP

        /// Driver enable mode
        @ReadWrite(bits: 14..<15)
        public var dem: DEM

        /// DMA Disable on Reception Error
        @ReadWrite(bits: 13..<14)
        public var ddre: DDRE

        /// Overrun Disable
        @ReadWrite(bits: 12..<13)
        public var ovrdis: OVRDIS

        /// One sample bit method enable
        @ReadWrite(bits: 11..<12)
        public var onebit: ONEBIT

        /// CTS interrupt enable
        @ReadWrite(bits: 10..<11)
        public var ctsie: CTSIE

        /// CTS enable
        @ReadWrite(bits: 9..<10)
        public var ctse: CTSE

        /// RTS enable
        @ReadWrite(bits: 8..<9)
        public var rtse: RTSE

        /// DMA enable transmitter
        @ReadWrite(bits: 7..<8)
        public var dmat: DMAT

        /// DMA enable receiver
        @ReadWrite(bits: 6..<7)
        public var dmar: DMAR

        /// Smartcard mode enable
        @ReadWrite(bits: 5..<6)
        public var scen: SCEN

        /// Smartcard NACK enable
        @ReadWrite(bits: 4..<5)
        public var nack: NACK

        /// Half-duplex selection
        @ReadWrite(bits: 3..<4)
        public var hdsel: HDSEL

        /// Ir low-power
        @ReadWrite(bits: 2..<3)
        public var irlp: IRLP

        /// Ir mode enable
        @ReadWrite(bits: 1..<2)
        public var iren: IREN

        /// Error interrupt enable
        @ReadWrite(bits: 0..<1)
        public var eie: EIE
    }

    /// Baud rate register
    @Register(bitWidth: 32)
    public struct BRR {
        /// DIV_Mantissa
        @ReadWrite(bits: 4..<16)
        public var div_mantissa: DIV_Mantissa

        /// DIV_Fraction
        @ReadWrite(bits: 0..<4)
        public var div_fraction: DIV_Fraction
    }

    /// Guard time and prescaler register
    @Register(bitWidth: 32)
    public struct GTPR {
        /// Guard time value
        @ReadWrite(bits: 8..<16)
        public var gt: GT

        /// Prescaler value
        @ReadWrite(bits: 0..<8)
        public var psc: PSC
    }

    /// Receiver timeout register
    @Register(bitWidth: 32)
    public struct RTOR {
        /// Block Length
        @ReadWrite(bits: 24..<32)
        public var blen: BLEN

        /// Receiver timeout value
        @ReadWrite(bits: 0..<24)
        public var rto: RTO
    }

    /// Request register
    @Register(bitWidth: 32)
    public struct RQR {
        /// Transmit data flush request
        @WriteOnly(bits: 4..<5)
        public var txfrq: TXFRQ

        /// Receive data flush request
        @WriteOnly(bits: 3..<4)
        public var rxfrq: RXFRQ

        /// Mute mode request
        @WriteOnly(bits: 2..<3)
        public var mmrq: MMRQ

        /// Send break request
        @WriteOnly(bits: 1..<2)
        public var sbkrq: SBKRQ

        /// Auto baud rate request
        @WriteOnly(bits: 0..<1)
        public var abrrq: ABRRQ
    }

    /// Interrupt & status register
    @Register(bitWidth: 32)
    public struct ISR {
        /// REACK
        @ReadOnly(bits: 22..<23)
        public var reack: REACK

        /// TEACK
        @ReadOnly(bits: 21..<22)
        public var teack: TEACK

        /// WUF
        @ReadOnly(bits: 20..<21)
        public var wuf: WUF

        /// RWU
        @ReadOnly(bits: 19..<20)
        public var rwu: RWU

        /// SBKF
        @ReadOnly(bits: 18..<19)
        public var sbkf: SBKF

        /// CMF
        @ReadOnly(bits: 17..<18)
        public var cmf: CMF

        /// BUSY
        @ReadOnly(bits: 16..<17)
        public var busy: BUSY

        /// ABRF
        @ReadOnly(bits: 15..<16)
        public var abrf: ABRF

        /// ABRE
        @ReadOnly(bits: 14..<15)
        public var abre: ABRE

        /// EOBF
        @ReadOnly(bits: 12..<13)
        public var eobf: EOBF

        /// RTOF
        @ReadOnly(bits: 11..<12)
        public var rtof: RTOF

        /// CTS
        @ReadOnly(bits: 10..<11)
        public var cts: CTS

        /// CTSIF
        @ReadOnly(bits: 9..<10)
        public var ctsif: CTSIF

        /// LBDF
        @ReadOnly(bits: 8..<9)
        public var lbdf: LBDF

        /// TXE
        @ReadOnly(bits: 7..<8)
        public var txe: TXE

        /// TC
        @ReadOnly(bits: 6..<7)
        public var tc: TC

        /// RXNE
        @ReadOnly(bits: 5..<6)
        public var rxne: RXNE

        /// IDLE
        @ReadOnly(bits: 4..<5)
        public var idle: IDLE

        /// ORE
        @ReadOnly(bits: 3..<4)
        public var ore: ORE

        /// NF
        @ReadOnly(bits: 2..<3)
        public var nf: NF

        /// FE
        @ReadOnly(bits: 1..<2)
        public var fe: FE

        /// PE
        @ReadOnly(bits: 0..<1)
        public var pe: PE
    }

    /// Interrupt flag clear register
    @Register(bitWidth: 32)
    public struct ICR {
        /// Wakeup from Stop mode clear flag
        @WriteOnly(bits: 20..<21)
        public var wucf: WUCF

        /// Character match clear flag
        @WriteOnly(bits: 17..<18)
        public var cmcf: CMCF

        /// End of block clear flag
        @WriteOnly(bits: 12..<13)
        public var eobcf: EOBCF

        /// Receiver timeout clear flag
        @WriteOnly(bits: 11..<12)
        public var rtocf: RTOCF

        /// CTS clear flag
        @WriteOnly(bits: 9..<10)
        public var ctscf: CTSCF

        /// LIN break detection clear flag
        @WriteOnly(bits: 8..<9)
        public var lbdcf: LBDCF

        /// Transmission complete clear flag
        @WriteOnly(bits: 6..<7)
        public var tccf: TCCF

        /// Idle line detected clear flag
        @WriteOnly(bits: 4..<5)
        public var idlecf: IDLECF

        /// Overrun error clear flag
        @WriteOnly(bits: 3..<4)
        public var orecf: ORECF

        /// Noise detected clear flag
        @WriteOnly(bits: 2..<3)
        public var ncf: NCF

        /// Framing error clear flag
        @WriteOnly(bits: 1..<2)
        public var fecf: FECF

        /// Parity error clear flag
        @WriteOnly(bits: 0..<1)
        public var pecf: PECF
    }

    /// Receive data register
    @Register(bitWidth: 32)
    public struct RDR {
        /// Receive data value
        @ReadOnly(bits: 0..<9)
        public var rdr_field: RDR_FIELD
    }

    /// Transmit data register
    @Register(bitWidth: 32)
    public struct TDR {
        /// Transmit data value
        @ReadWrite(bits: 0..<9)
        public var tdr_field: TDR_FIELD
    }
}
