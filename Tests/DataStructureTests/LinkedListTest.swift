//
//  LinkedListTest.swift
//  DataStructureTests
//
//  Created by Tieda Wei on 2021-02-06.
//

import XCTest
@testable import DataStructure

final class LinkedListTest: XCTestCase {

    func test_initWithArrayLiteral() {
        let list: LinkedList<Int> = [1, 3, 4]
        XCTAssertEqual(list.array, [1, 3, 4])
    }
    
    func test_initWithEmptyArray() {
        let list = LinkedList(array: [Int]())

        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
        XCTAssertEqual(list.array, [])
    }
    
    func test_append() {
        let list: LinkedList<Int> = []
        
        list.append(1)
        XCTAssertEqual(list.array, [1])
        XCTAssertEqual(try XCTUnwrap(list.first?.value), 1)
        XCTAssertEqual(try XCTUnwrap(list.last?.value), 1)
        
        list.append(2)
        XCTAssertEqual(list.array, [1, 2])
        XCTAssertEqual(try XCTUnwrap(list.first?.value), 1)
        XCTAssertEqual(try XCTUnwrap(list.last?.value), 2)
        
        list.append(3)
        XCTAssertEqual(try XCTUnwrap(list.first?.value), 1)
        XCTAssertEqual(try XCTUnwrap(list.last?.value), 3)
        XCTAssertEqual(list.array, [1, 2, 3])
    }
    
    func test_insertAtBeginning() {
        let list: LinkedList<Int> = []
        
        list.insertAtBeginning(0)
        XCTAssertEqual(list.array, [0])
        XCTAssertEqual(try XCTUnwrap(list.first?.value), 0)
        XCTAssertEqual(try XCTUnwrap(list.last?.value), 0)

        list.insertAtBeginning(1)
        XCTAssertEqual(list.array, [1, 0])
        XCTAssertEqual(try XCTUnwrap(list.first?.value), 1)
        XCTAssertEqual(try XCTUnwrap(list.last?.value), 0)
    }
}
