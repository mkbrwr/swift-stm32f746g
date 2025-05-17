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
        TouchPanel.initialize()

        while true {
            let touchdata = TouchPanel.readTouchData()
            if touchdata.numberOfTouchPoints > 0 {
                drawRect(x: 272 - touchdata.y, y: touchdata.x, width: 24, height: 24)
            }
            Lcd.reloadConfiguration()
        }
    }
}

func initHeap() {
    topPointer = UnsafeMutablePointer<UInt8>(bitPattern: 0x2001_0000)!  // start of sram1
    endPointer = UnsafeMutablePointer<UInt8>(bitPattern: 0x2004_C000)!  // end of sram1
}

func drawPoint(x: Int, y: Int, color: UInt32 = 0xffffffff) {
    guard x > 0 && y > 0 && x < 272 && y < 480 else {
        print("Out of bounds!")
        return
    }
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
