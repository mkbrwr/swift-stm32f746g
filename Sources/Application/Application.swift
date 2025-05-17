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
            drawRect(x: 130, y: 140, width: 90, height: 120, color: 0xffff00ff)
            drawRect(x: 10, y: 20, width: 10, height: 20)
            drawPoint(x: 40, y: 60)
            drawPoint(x: 90, y: 120)
            Lcd.reloadConfiguration()
        }
    }
}

func drawPoint(x: Int, y: Int, color: UInt32 = 0xffffffff) {
    let xA = y
    let yA = 272 - x
    dramBaseAsUInt32[yA * 480 + xA] = color
}

func drawRect(x: Int, y: Int, width: Int, height: Int, color: UInt32 = 0xffffffff) {
    for offsetX in 0..<width {
        for offsetY in 0..<height {
            drawPoint(x: x + offsetX, y: y + offsetY)
        }
    }
}
