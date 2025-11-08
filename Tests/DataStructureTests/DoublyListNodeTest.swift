//
//  DoublyListNodeTest.swift
//  DataStructure
//
//  Created by Tieda Wei on 2025-11-08.
//

import XCTest
import DataStructure

final class DoublyListNodeTest: XCTestCase {
	func test_make_array() {
		let head = DoublyListNode.make([1, 2, 3, 4])
		
		XCTAssertEqual(head?.val, 1)
		XCTAssertEqual(head?.prev?.val, nil)
		
		let sec = head?.next
		XCTAssertEqual(sec?.val, 2)
		XCTAssertEqual(sec?.prev?.val, 1)
		
		let third = sec?.next
		XCTAssertEqual(third?.val, 3)
		XCTAssertEqual(third?.prev?.val, 2)
		
		let forth = third?.next
		XCTAssertEqual(forth?.val, 4)
		XCTAssertEqual(forth?.next?.val, nil)
		XCTAssertEqual(forth?.prev?.val, 3)
	}
}
