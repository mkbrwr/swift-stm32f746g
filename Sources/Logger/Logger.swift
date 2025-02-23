import UART

public enum Logger {
    private static let uart = UART()

    // public static func log(_ message: consuming String) {
    //     uart.write(message + "\r\n")
    // }

    public static func log(_ number: UInt8) {
        uart.write(number)
    }
}