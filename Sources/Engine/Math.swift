private let π = Float.pi
private let π_2 = Float.pi / 2

/// Approximation of sine function using Taylor series
/// - Parameter x: Angle in radians
/// - Returns: Sine value of the angle
func sin(_ x: Float) -> Float {
    // Normalize x to range [0, 2π)
    var normalizedX = x
    while normalizedX < 0 { normalizedX += 2 * π }
    while normalizedX >= 2 * π { normalizedX -= 2 * π }

    // Taylor series approximation of sine
    let x2 = normalizedX * normalizedX
    let x3 = x2 * normalizedX
    let x5 = x3 * x2
    let x7 = x5 * x2
    let x9 = x7 * x2
    let x11 = x9 * x2

    // Taylor series: x - x^3/3! + x^5/5! - x^7/7! + x^9/9! - x^11/11!
    return normalizedX - (x3 / 6.0) + (x5 / 120.0) - (x7 / 5040.0) + (x9 / 362880.0)
        - (x11 / 39916800.0)
}

/// Approximation of cosine function using Taylor series
/// - Parameter x: Angle in radians
/// - Returns: Cosine value of the angle
func cos(_ x: Float) -> Float {
    // Shift by π/2 to use sine implementation
    var shifted = x + π_2

    // Normalize to [0, 2π)
    while shifted < 0 { shifted += 2 * π }
    while shifted >= 2 * π { shifted -= 2 * π }

    return sin(shifted)
}
