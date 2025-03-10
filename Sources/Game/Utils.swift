//
//  Utils.swift
//  Swift-STM32F746G
//
//  Created by Mykhailo Tymchyshyn on 22.12.2024.
//

import Support

public func delay(ms milliseconds: Int) {
    for _ in 0..<100_000 * milliseconds {
        nop()
    }
}
