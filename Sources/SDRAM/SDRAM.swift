import Support

public struct SDRAM {
   public static func initializeSDRAM() {
        // # HAL_SDRAM_Init
        // HAL_SDRAM_MspInit
        rcc.ahb1enr.modify { rw in
            rw.raw.gpiocen = 1
            rw.raw.gpioden = 1
            rw.raw.gpioeen = 1
            rw.raw.gpiofen = 1
            rw.raw.gpiogen = 1
            rw.raw.gpiohen = 1
        }
        rcc.ahb3enr.modify { rw in
            rw.raw.fmcen = 1
        }

        // GPIOC configuration
        gpioc.moder.modify { rw in
            rw.raw.moder3 = 2  // AF mode
        }
        gpioc.pupdr.modify { rw in
            rw.raw.pupdr3 = 1  // Pull-up
        }
        gpioc.ospeedr.modify { rw in
            rw.raw.ospeedr3 = 2  // Fast speed
        }
        gpioc.afrl.modify { rw in
            rw.raw.afrl3 = 12  // AF12
        }

        // GPIOD configuration
        gpiod.moder.modify { rw in
            rw.raw.moder0 = 2; rw.raw.moder1 = 2; rw.raw.moder8 = 2; rw.raw.moder9 = 2
            rw.raw.moder10 = 2; rw.raw.moder14 = 2; rw.raw.moder15 = 2
        }
        gpiod.pupdr.modify { rw in
            rw.raw.pupdr0 = 1; rw.raw.pupdr1 = 1; rw.raw.pupdr8 = 1; rw.raw.pupdr9 = 1
            rw.raw.pupdr10 = 1; rw.raw.pupdr14 = 1; rw.raw.pupdr15 = 1
        }
        gpiod.ospeedr.modify { rw in
            rw.raw.ospeedr0 = 2; rw.raw.ospeedr1 = 2; rw.raw.ospeedr8 = 2; rw.raw.ospeedr9 = 2
            rw.raw.ospeedr10 = 2; rw.raw.ospeedr14 = 2; rw.raw.ospeedr15 = 2
        }
        gpiod.afrl.modify { rw in
            rw.raw.afrl0 = 12; rw.raw.afrl1 = 12
        }
        gpiod.afrh.modify { rw in
            rw.raw.afrh8 = 12; rw.raw.afrh9 = 12; rw.raw.afrh10 = 12
            rw.raw.afrh14 = 12; rw.raw.afrh15 = 12
        }

        // GPIOE configuration
        gpioe.moder.modify { rw in
            rw.raw.moder0 = 2; rw.raw.moder1 = 2; rw.raw.moder7 = 2; rw.raw.moder8 = 2; rw.raw.moder9 = 2
            rw.raw.moder10 = 2; rw.raw.moder11 = 2; rw.raw.moder12 = 2; rw.raw.moder13 = 2
            rw.raw.moder14 = 2; rw.raw.moder15 = 2
        }
        gpioe.pupdr.modify { rw in
            rw.raw.pupdr0 = 1; rw.raw.pupdr1 = 1; rw.raw.pupdr7 = 1; rw.raw.pupdr8 = 1; rw.raw.pupdr9 = 1
            rw.raw.pupdr10 = 1; rw.raw.pupdr11 = 1; rw.raw.pupdr12 = 1; rw.raw.pupdr13 = 1
            rw.raw.pupdr14 = 1; rw.raw.pupdr15 = 1
        }
        gpioe.ospeedr.modify { rw in
            rw.raw.ospeedr0 = 2; rw.raw.ospeedr1 = 2; rw.raw.ospeedr7 = 2; rw.raw.ospeedr8 = 2
            rw.raw.ospeedr9 = 2; rw.raw.ospeedr10 = 2; rw.raw.ospeedr11 = 2; rw.raw.ospeedr12 = 2
            rw.raw.ospeedr13 = 2; rw.raw.ospeedr14 = 2; rw.raw.ospeedr15 = 2
        }
        gpioe.afrl.modify { rw in
            rw.raw.afrl0 = 12; rw.raw.afrl1 = 12; rw.raw.afrl7 = 12
        }
        gpioe.afrh.modify { rw in
            rw.raw.afrh8 = 12; rw.raw.afrh9 = 12; rw.raw.afrh10 = 12; rw.raw.afrh11 = 12
            rw.raw.afrh12 = 12; rw.raw.afrh13 = 12; rw.raw.afrh14 = 12; rw.raw.afrh15 = 12
        }

        // GPIOF configuration
        gpiof.moder.modify { rw in
            rw.raw.moder0 = 2; rw.raw.moder1 = 2; rw.raw.moder2 = 2; rw.raw.moder3 = 2; rw.raw.moder4 = 2
            rw.raw.moder5 = 2; rw.raw.moder11 = 2; rw.raw.moder12 = 2; rw.raw.moder13 = 2
            rw.raw.moder14 = 2; rw.raw.moder15 = 2
        }
        gpiof.pupdr.modify { rw in
            rw.raw.pupdr0 = 1; rw.raw.pupdr1 = 1; rw.raw.pupdr2 = 1; rw.raw.pupdr3 = 1; rw.raw.pupdr4 = 1
            rw.raw.pupdr5 = 1; rw.raw.pupdr11 = 1; rw.raw.pupdr12 = 1; rw.raw.pupdr13 = 1
            rw.raw.pupdr14 = 1; rw.raw.pupdr15 = 1
        }
        gpiof.ospeedr.modify { rw in
            rw.raw.ospeedr0 = 2; rw.raw.ospeedr1 = 2; rw.raw.ospeedr2 = 2; rw.raw.ospeedr3 = 2
            rw.raw.ospeedr4 = 2; rw.raw.ospeedr5 = 2; rw.raw.ospeedr11 = 2; rw.raw.ospeedr12 = 2
            rw.raw.ospeedr13 = 2; rw.raw.ospeedr14 = 2; rw.raw.ospeedr15 = 2
        }
        gpiof.afrl.modify { rw in
            rw.raw.afrl0 = 12; rw.raw.afrl1 = 12; rw.raw.afrl2 = 12; rw.raw.afrl3 = 12
            rw.raw.afrl4 = 12; rw.raw.afrl5 = 12
        }
        gpiof.afrh.modify { rw in
            rw.raw.afrh11 = 12; rw.raw.afrh12 = 12; rw.raw.afrh13 = 12
            rw.raw.afrh14 = 12; rw.raw.afrh15 = 12
        }

        // GPIOG configuration
        gpiog.moder.modify { rw in
            rw.raw.moder0 = 2; rw.raw.moder1 = 2; rw.raw.moder4 = 2; rw.raw.moder5 = 2
            rw.raw.moder8 = 2; rw.raw.moder15 = 2
        }
        gpiog.pupdr.modify { rw in
            rw.raw.pupdr0 = 1; rw.raw.pupdr1 = 1; rw.raw.pupdr4 = 1; rw.raw.pupdr5 = 1
            rw.raw.pupdr8 = 1; rw.raw.pupdr15 = 1
        }
        gpiog.ospeedr.modify { rw in
            rw.raw.ospeedr0 = 2; rw.raw.ospeedr1 = 2; rw.raw.ospeedr4 = 2; rw.raw.ospeedr5 = 2
            rw.raw.ospeedr8 = 2; rw.raw.ospeedr15 = 2
        }
        gpiog.afrl.modify { rw in
            rw.raw.afrl0 = 12; rw.raw.afrl1 = 12; rw.raw.afrl4 = 12; rw.raw.afrl5 = 12
        }
        gpiog.afrh.modify { rw in
            rw.raw.afrh8 = 12; rw.raw.afrh15 = 12
        }

        // GPIOH configuration
        gpioh.moder.modify { rw in
            rw.raw.moder3 = 2; rw.raw.moder5 = 2
        }
        gpioh.pupdr.modify { rw in
            rw.raw.pupdr3 = 1; rw.raw.pupdr5 = 1
        }
        gpioh.ospeedr.modify { rw in
            rw.raw.ospeedr3 = 2; rw.raw.ospeedr5 = 2
        }
        gpioh.afrl.modify { rw in
            rw.raw.afrl3 = 12; rw.raw.afrl5 = 12
        }

        // FMC_SDRAM_Init
        fmc.sdcr1.modify { rw in
            rw.raw.nc = 0      // Number of column bits: 8
            rw.raw.nr = 1      // Number of row bits: 12
            rw.raw.mwid = 1    // Memory width: 16 bits
            rw.raw.nb = 1      // Number of banks: 4
            rw.raw.cas = 2     // CAS Latency: 2 cycles
            rw.raw.wp = 0      // Write protection: disabled
            rw.raw.sdclk = 2   // SDCLK = HCLK/2
            rw.raw.rburst = 1  // Read burst: enabled
            rw.raw.rpipe = 0   // Read pipe: no delay
        }

        // FMC_SDRAM_Timing_Init
        fmc.sdtr1.modify { rw in
            rw.raw.tmrd = 2 - 1  // Load Mode Register to Active
            rw.raw.txsr = 6 - 1  // Exit Self-refresh to Active
            rw.raw.tras = 4 - 1  // Self-refresh time
            rw.raw.trc  = 6 - 1  // Row cycle time
            rw.raw.twr  = 2 - 1  // Write Recovery Time
            rw.raw.trp  = 2 - 1  // Row precharge
            rw.raw.trcd = 2 - 1  // Row to column delay
        }

        // BSP_SDRAM_Initialization_Sequence(&hsdram, &command);
        let command1 = Command(
            mode: 1,
            target: 1,
            autoRefreshNumber: 1, 
            modeRegisterDefinition: 0
        )
        sendCommand(command1)
        delay(ms: 1)
        
        let command2 = Command(
            mode: 2,
            target: 1,
            autoRefreshNumber: 1, 
            modeRegisterDefinition: 0
        )
        sendCommand(command2)
        delay(ms: 1)

        let command3 = Command(
            mode: 3,
            target: 1,
            autoRefreshNumber: 8, 
            modeRegisterDefinition: 0
        )
        sendCommand(command3)
        let command4 = Command(
            mode: 4,
            target: 1,
            autoRefreshNumber: 1, 
            modeRegisterDefinition: 544 
        )
        sendCommand(command4)
        delay(ms: 1)

        fmc.sdrtr.modify { r, w in 
            w.raw.count = 2584
        }
    }

    private struct Command {
        let mode: UInt32
        let target: UInt32
        let autoRefreshNumber: UInt32
        let modeRegisterDefinition: UInt32
    }

    private static func sendCommand(_ command: Command) {
        while fmc.sdsr.read().raw.busy != 0 {
            nop()
        } 
        fmc.sdcmr.write { w in
            w.raw.mode = command.mode
            w.raw.ctb1 = command.target
            w.raw.nrfs = (command.autoRefreshNumber - 1)
            w.raw.mrd = command.modeRegisterDefinition
        }
    }
}

func delay(ms milliseconds: Int) {
    for _ in 0..<100_000 * milliseconds {
        nop()
    }
}