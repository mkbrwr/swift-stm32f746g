enum Texture {
    case singleColorTexture(SingleColorTexture)
    case bufferBackedTexture(BufferBackedTexture)
    
    var size: Size {
        switch self {
            case let .singleColorTexture(texture): return texture.size
            case let .bufferBackedTexture(texture): return texture.size
        }
    }

    func getPixel(at line: (UInt, UInt)) -> Color {
        switch self {
            case let .singleColorTexture(texture): return texture.getPixel(at: line)
            case let .bufferBackedTexture(texture): return texture.getPixel(at: line)
        }
    }
}

struct SingleColorTexture {
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

struct BufferBackedTexture {
    let size: Size
    private let pixelBuffer: UnsafePointer<Color>
    
    init(size: Size, pixelBuffer: UnsafePointer<Color>) {
        self.size = size
        self.pixelBuffer = pixelBuffer
    }

    func getPixel(at line: (UInt, UInt)) -> Color {
        // tmp
        return 0xffff00ff;
        // pixelBuffer.advanced(by: Int(line.0 * size.width + line.1)).pointee
    }
}