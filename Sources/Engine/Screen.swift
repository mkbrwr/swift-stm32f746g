public typealias Coordinate = Int
public typealias Color = UInt32

public protocol Screen {
    /// Draw colored pixel to the screen
    /// - Parameters:
    ///   - color: color
    ///   - at: x, y pair of coordinates
    ///
    func draw(_ color: Color, at: (x: Coordinate, y: Coordinate))

    /// Size of the screen
    var size: (width: Int, height: Int) { get }
}