protocol Texture {
    var size: Size { get }
    func getPixel(at line: (UInt, UInt)) -> Color
}

struct SingleColorTexture: Texture {
    let size: Size
    let color: Color

    init(size: Size, color: Color) {
        self.size = size
        self.color = color
    }

    func getPixel(at line: (UInt, UInt)) -> Color {
        return color        
    }
}