//
//  DoublyListNode.swift
//  DataStructure
//
//  Created by Tieda Wei on 2025-11-08.
//

public class DoublyListNode<Element> {
	public var val: Element
	public var prev: DoublyListNode?
	public var next: DoublyListNode?
	
	public init(_ val: Element) {
		self.val = val
	}
	
	public static func make(
		_ values: [Element]
	) -> DoublyListNode? {
		guard let first = values.first else { return nil }
		
		let head = DoublyListNode(first)
		
		var cur = head
		for i in 1..<values.count {
			let new = DoublyListNode(values[i])
			cur.next = new
			new.prev = cur
			
			cur = new
		}
		
		return head
	}
}
