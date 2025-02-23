import UART

public enum Logger {
    private static let uart = UART()

    // public static func log(_ message: String) {
    //     uart.write(message)
    // }

    public static func log(_ number: UInt8) {
        uart.write(number)
    }
}