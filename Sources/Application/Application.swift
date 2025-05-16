import Support

@main
struct Application {
    static func main() {
        initDebug()
        initUartOutput()

        var x: UInt8 = 49
        while true {
            tx(value: x)
            x += 1
            for _ in 0...100_000 {
                nop()
            }
        }
    }
}
