import Engine
import MetalKit
import SwiftUI

struct MetalView: NSViewRepresentable {
    func makeNSView(context: Context) -> MTKView {
        let metalView = MTKView()
        metalView.delegate = context.coordinator

        metalView.device = MTLCreateSystemDefaultDevice()
        metalView.colorPixelFormat = .bgra8Unorm
        metalView.clearColor = MTLClearColor(red: 0.1, green: 0.1, blue: 0.2, alpha: 1.0)
        metalView.enableSetNeedsDisplay = true

        context.coordinator.setupMetal(metalView: metalView)

        return metalView
    }

    func updateNSView(_ nsView: MTKView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    @MainActor
    class Coordinator: NSObject, MTKViewDelegate {
        private var renderer: Renderer?
        var engine = Engine()

        func setupMetal(metalView: MTKView) {
            renderer = Renderer(metalKitView: metalView)
        }

        func draw(in view: MTKView) {
            engine.start()
            engine.draw(on: renderer!)
            renderer?.draw(in: view)
        }

        func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
            renderer?.mtkView(view, drawableSizeWillChange: size)
        }
    }
}
