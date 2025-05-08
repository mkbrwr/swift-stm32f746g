import Metal
import MetalKit

public class ShaderCompiler {
    public let device: MTLDevice
    public let library: MTLLibrary

    public init?(device: MTLDevice) {
        self.device = device

        do {
            guard let url = Bundle.module.url(forResource: "Shaders", withExtension: "metal") else {
                fatalError("Failed to find shader file in bundle")
            }

            let shaderSource = try String(contentsOf: url, encoding: .utf8)

            let compileOptions = MTLCompileOptions()
            compileOptions.languageVersion = .version3_2

            self.library = try device.makeLibrary(source: shaderSource, options: compileOptions)
        } catch {
            fatalError("Failed to load shader: \(error.localizedDescription)")
        }
    }
}
