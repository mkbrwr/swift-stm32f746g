public struct RandomNumberGeneratorPeripheral: RandomNumberGenerator {
    public init() {
        rcc.ahb2enr.modify { rw in 
            rw.raw.rngen = 1
        }
    }

    public func next() -> UInt64 {
        rng.cr.modify { w in
        w.raw.rngen = 1  
        }
        while rng.sr.read().raw.drdy != 1 {}

        return UInt64(rng.dr.read().raw.rndata)
    }
}