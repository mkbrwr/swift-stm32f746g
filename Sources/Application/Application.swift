import Support

@main
struct Application {
    static func main() {
        initHeap()
        initDebug()
        initUartOutput()

        let buf = [UInt8](repeating: 49, count: 5)
        while true {
            for x in buf {
                tx(value: x)
            }
            nop()
        }
    }
}
