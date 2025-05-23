import Support

@main
struct Application {
    static func main() {
        initHeap()

        initClocks()
        systemSetCoreClock()

        initDebug()
        initUartOutput()

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
    topPointer = UnsafeMutablePointer<UInt8>(bitPattern: 0x20010000)!  // start of sram1a
    endPointer = UnsafeMutablePointer<UInt8>(bitPattern: 0x20042fff)!  // end of sram1a
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
