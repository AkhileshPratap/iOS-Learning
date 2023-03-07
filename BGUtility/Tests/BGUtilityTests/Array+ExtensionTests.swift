//
//  Array+ExtensionTests.swift
//  
//
//  Created by AkhileshSingh on 07/03/23.
//

import XCTest
@testable import BGUtility

final class Array_ExtensionTests: XCTestCase {
    
    func testProperValue() {
        let numbers = [1, 2, 3, 4, 5]
        let num = numbers[safeIndex: 0]
        XCTAssert(num == 1)
    }
    
    func testOutOfIndex() {
        let numbers = [1, 2, 3, 4, 5]
        let num = numbers[safeIndex: 10]
        XCTAssert(num == nil)
    }

}
