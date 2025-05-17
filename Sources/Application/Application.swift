import Support

@main
struct Application {
    static func main() {
        initHeap()
        initDebug()
        initUartOutput()

        initClocks()
        systemSetCoreClock()

        // We are running at 200 MHz CPU frequency now. Set the UART baud rate to
        // 115200 again based on the new CPU frequency.
        usart1.brr.modify { $0.raw.storage = 100_000_000 / 115_200 }

        initGpio()
        initSdram()
        Lcd.initialize()

        while true {
            for x in 0..<272 {
                for y in 0..<480 {
                    dramBaseAsUInt32[x * 480 + y] = 0xff00_0000 + UInt32(x) + UInt32(y) << 8
                }
            }
            Lcd.reloadConfiguration()
        }
    }
}
