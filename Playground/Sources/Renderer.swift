import Engine
import MetalKit
import PlaygroundSupport

class Renderer: NSObject, MTKViewDelegate {
    private var renderTargetTexture: MTLTexture!
    private var renderToTextureRenderPassDescriptor: MTLRenderPassDescriptor!
    private var renderToTextureRenderPipeline: MTLRenderPipelineState!
    private var drawableRenderPipeline: MTLRenderPipelineState!
    private var aspectRatio: Float = 1.0
    private var device: MTLDevice!
    private var commandQueue: MTLCommandQueue!
    private var textureBuffer: MTLBuffer!
    private var textureSize: CGSize!
    private var bytesPerRow: Int!
    private var region: MTLRegion!

    @MainActor
    init(metalKitView mtkView: MTKView) {
        super.init()
        device = mtkView.device!
        commandQueue = device.makeCommandQueue()

        let texDescriptor = MTLTextureDescriptor()
        texDescriptor.textureType = .type2D
        texDescriptor.width = 512
        texDescriptor.height = 512
        texDescriptor.pixelFormat = .rgba8Unorm
        texDescriptor.usage = [.renderTarget, .shaderRead]

        renderTargetTexture = device.makeTexture(descriptor: texDescriptor)

        textureSize = CGSize(width: 512, height: 512)
        bytesPerRow = 4 * Int(textureSize.width)
        region = MTLRegion(
            origin: MTLOrigin(x: 0, y: 0, z: 0),
            size: MTLSize(width: Int(textureSize.width), height: Int(textureSize.height), depth: 1)
        )

        let bufferSize = bytesPerRow * Int(textureSize.height)
        textureBuffer = device.makeBuffer(length: bufferSize, options: .storageModeShared)

        clearTextureBuffer(color: (1.0, 1.0, 1.0, 1.0))

        renderToTextureRenderPassDescriptor = MTLRenderPassDescriptor()

        renderToTextureRenderPassDescriptor.colorAttachments[0].texture = renderTargetTexture

        renderToTextureRenderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderToTextureRenderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(
            red: 1, green: 1, blue: 1, alpha: 1)

        renderToTextureRenderPassDescriptor.colorAttachments[0].storeAction = .store

        let defaultLibrary = ShaderCompiler(device: device)!.library

        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.label = "Drawable Render Pipeline"
        pipelineStateDescriptor.sampleCount = mtkView.sampleCount
        pipelineStateDescriptor.vertexFunction = defaultLibrary.makeFunction(
            name: "textureVertexShader")
        pipelineStateDescriptor.fragmentFunction = defaultLibrary.makeFunction(
            name: "textureFragmentShader")
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = mtkView.colorPixelFormat
        pipelineStateDescriptor.vertexBuffers[0]
            .mutability =
            .immutable

        do {
            drawableRenderPipeline = try device.makeRenderPipelineState(
                descriptor: pipelineStateDescriptor)
        } catch {
            fatalError("Failed to create pipeline state to render to screen: \(error)")
        }

        pipelineStateDescriptor.label = "Offscreen Render Pipeline"
        pipelineStateDescriptor.rasterSampleCount = 1
        pipelineStateDescriptor.vertexFunction = defaultLibrary.makeFunction(
            name: "simpleVertexShader")
        pipelineStateDescriptor.fragmentFunction = defaultLibrary.makeFunction(
            name: "simpleFragmentShader")
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = renderTargetTexture.pixelFormat

        do {
            renderToTextureRenderPipeline = try device.makeRenderPipelineState(
                descriptor: pipelineStateDescriptor)
        } catch {
            fatalError("Failed to create pipeline state to render to texture: \(error)")
        }
    }

    func clearTextureBuffer(color: (Float, Float, Float, Float)) {
        let contents = textureBuffer.contents()

        let r = UInt8(color.0 * 255.0)
        let g = UInt8(color.1 * 255.0)
        let b = UInt8(color.2 * 255.0)
        let a = UInt8(color.3 * 255.0)

        let bufferPointer = contents.bindMemory(
            to: UInt8.self, capacity: bytesPerRow * Int(textureSize.height))

        for y in 0..<Int(textureSize.height) {
            for x in 0..<Int(textureSize.width) {
                let pixelOffset = (y * bytesPerRow) + (x * 4)
                bufferPointer[pixelOffset] = r
                bufferPointer[pixelOffset + 1] = g
                bufferPointer[pixelOffset + 2] = b
                bufferPointer[pixelOffset + 3] = a
            }
        }
    }

    func setPixel(x: Int, y: Int, color: (Float, Float, Float, Float)) {
        let contents = textureBuffer.contents()
        guard x >= 0 && x < Int(textureSize.width) && y >= 0 && y < Int(textureSize.height) else {
            return
        }

        let r = UInt8(color.0 * 255.0)
        let g = UInt8(color.1 * 255.0)
        let b = UInt8(color.2 * 255.0)
        let a = UInt8(color.3 * 255.0)

        let bufferPointer = contents.bindMemory(
            to: UInt8.self, capacity: bytesPerRow * Int(textureSize.height))

        let flippedY = Int(textureSize.height) - 1 - y
        let pixelOffset = (flippedY * bytesPerRow) + (x * 4)

        bufferPointer[pixelOffset] = r
        bufferPointer[pixelOffset + 1] = g
        bufferPointer[pixelOffset + 2] = b
        bufferPointer[pixelOffset + 3] = a
    }

    func drawLine(from: (Int, Int), to: (Int, Int), color: (Float, Float, Float, Float)) {
        let x0 = from.0
        let y0 = from.1
        let x1 = to.0
        let y1 = to.1

        let dx = abs(x1 - x0)
        let sx = x0 < x1 ? 1 : -1
        let dy = -abs(y1 - y0)
        let sy = y0 < y1 ? 1 : -1
        var err = dx + dy
        var e2: Int

        var currentX = x0
        var currentY = y0

        while true {
            setPixel(x: currentX, y: currentY, color: color)
            if currentX == x1 && currentY == y1 { break }
            e2 = 2 * err
            if e2 >= dy {
                if currentX == x1 { break }
                err += dy
                currentX += sx
            }
            if e2 <= dx {
                if currentY == y1 { break }
                err += dx
                currentY += sy
            }
        }
    }

    func drawGrid(cellSize: Int, color: (Float, Float, Float, Float)) {
        let width = Int(textureSize.width)
        let height = Int(textureSize.height)

        for x in stride(from: 0, through: width, by: cellSize) {
            drawLine(from: (x, 0), to: (x, height - 1), color: color)
        }

        for y in stride(from: 0, through: height, by: cellSize) {
            drawLine(from: (0, y), to: (width - 1, y), color: color)
        }
    }

    func drawRect(
        x: Int, y: Int, width: Int, height: Int, color: (Float, Float, Float, Float),
        fill: Bool = true
    ) {
        if fill {
            for currentY in y..<(y + height) {
                for currentX in x..<(x + width) {
                    setPixel(x: currentX, y: currentY, color: color)
                }
            }
        } else {
            drawLine(from: (x, y), to: (x + width - 1, y), color: color)
            drawLine(from: (x, y + height - 1), to: (x + width - 1, y + height - 1), color: color)
            drawLine(from: (x, y), to: (x, y + height - 1), color: color)
            drawLine(from: (x + width - 1, y), to: (x + width - 1, y + height - 1), color: color)
        }
    }

    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        aspectRatio = Float(size.height) / Float(size.width)
    }

    func draw(in view: MTKView) {
        let commandBuffer = commandQueue.makeCommandBuffer()
        commandBuffer?.label = "Command Buffer"

        let blitEncoder = commandBuffer?.makeBlitCommandEncoder()
        blitEncoder?.copy(
            from: textureBuffer,
            sourceOffset: 0,
            sourceBytesPerRow: bytesPerRow,
            sourceBytesPerImage: bytesPerRow * Int(textureSize.height),
            sourceSize: MTLSize(
                width: Int(textureSize.width),
                height: Int(textureSize.height),
                depth: 1
            ),
            to: renderTargetTexture,
            destinationSlice: 0,
            destinationLevel: 0,
            destinationOrigin: MTLOrigin(x: 0, y: 0, z: 0)
        )
        blitEncoder?.endEncoding()

        if let drawableRenderPassDescriptor = view.currentRenderPassDescriptor {
            let quadVertices: [AAPLTextureVertex] = [
                AAPLTextureVertex(
                    position: vector_float2(0.95, -0.95), texcoord: vector_float2(1.0, 1.0)),
                AAPLTextureVertex(
                    position: vector_float2(-0.95, -0.95), texcoord: vector_float2(0.0, 1.0)),
                AAPLTextureVertex(
                    position: vector_float2(-0.95, 0.95), texcoord: vector_float2(0.0, 0.0)),

                AAPLTextureVertex(
                    position: vector_float2(0.95, -0.95), texcoord: vector_float2(1.0, 1.0)),
                AAPLTextureVertex(
                    position: vector_float2(-0.95, 0.95), texcoord: vector_float2(0.0, 0.0)),
                AAPLTextureVertex(
                    position: vector_float2(0.95, 0.95), texcoord: vector_float2(1.0, 0.0)),
            ]

            guard
                let renderEncoder = commandBuffer?.makeRenderCommandEncoder(
                    descriptor: drawableRenderPassDescriptor)
            else {
                return
            }

            renderEncoder.label = "Drawable Render Pass"

            renderEncoder.setRenderPipelineState(drawableRenderPipeline)

            renderEncoder.setVertexBytes(
                quadVertices,
                length: MemoryLayout<AAPLTextureVertex>.stride * quadVertices.count,
                index: 0)

            renderEncoder.setVertexBytes(
                &aspectRatio,
                length: MemoryLayout<Float>.size,
                index: 1)

            renderEncoder.setFragmentTexture(
                renderTargetTexture, index: 0)

            renderEncoder.drawPrimitives(
                type: .triangle,
                vertexStart: 0,
                vertexCount: 6)

            renderEncoder.endEncoding()

            if let currentDrawable = view.currentDrawable {
                commandBuffer?.present(currentDrawable)
            }
        }

        commandBuffer?.commit()
    }
}

extension Renderer: Screen {
    func draw(_ color: Color, at: (x: Coordinate, y: Coordinate)) {
        let r = Float((color >> 16) & 0xFF) / 255.0
        let g = Float((color >> 8) & 0xFF) / 255.0
        let b = Float(color & 0xFF) / 255.0
        let a = Float((color >> 24) & 0xFF) / 255.0

        setPixel(x: at.x, y: at.y, color: (r, g, b, a))
    }

    /// Size of the screen
    var size: (width: Int, height: Int) { (480, 272) }
}
