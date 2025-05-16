nonisolated(unsafe) var topPointer: UnsafeMutableRawPointer!
nonisolated(unsafe) var endPointer: UnsafeMutableRawPointer!

@_cdecl("free")
public func free(_ ptr: UnsafeMutableRawPointer?) {
    print("call to free")
}

@_cdecl("posix_memalign")
public func posix_memalign(
    _ ptr: UnsafeMutablePointer<UnsafeMutableRawPointer?>, _ alignment: Int, _ size: Int
) -> CInt {
    print("call to posix_memalign")
    print(alignment)
    print(size)
    var count = alignment
    while count < size {
        count += alignment
    }
    let new = topPointer.advanced(by: count)
    if new >= endPointer {
        print("ENOMEM")
        return 22
    }

    ptr.pointee = new
    topPointer = new

    return 0
}

@_cdecl("__aeabi_memmove")
func aeabi_memmove(_ dest: UnsafeMutableRawPointer?, _ src: UnsafeRawPointer?, _ count: Int) {
    guard let dest, let src, count > 0 else { return }

    // Convert to byte pointers
    let destination = dest.assumingMemoryBound(to: UInt8.self)
    let source = src.assumingMemoryBound(to: UInt8.self)

    if dest < src {
        // Forward copy if destination is before source
        for i in 0..<count {
            destination[i] = source[i]
        }
    } else {
        // Backward copy if destination is after source (or same)
        for i in (0..<count).reversed() {
            destination[i] = source[i]
        }
    }
}
