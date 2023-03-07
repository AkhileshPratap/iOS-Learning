//
//  Array+Extension.swift
//  
//
//  Created by AkhileshSingh on 07/03/23.
//

import Foundation

public extension Array {
    subscript(safeIndex inputIndex: Int) -> Iterator.Element? {
        return inputIndex >= 0 && inputIndex < endIndex ? self[inputIndex] : nil
    }
}
