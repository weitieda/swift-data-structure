//
//  LinkedList.swift
//  Algorithms
//
//  Created by Tieda Wei on 2021-02-06.
//

import Foundation

public final class LinkedListNode<Element> {
    public var value: Element
    public var next: LinkedListNode?
    
    public init(value: Element, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

public final class LinkedList<Element>: ExpressibleByArrayLiteral {

    public typealias Node = LinkedListNode<Element>
    
    public private(set) var first: Node?
    public private(set) var last: Node?
    
    public convenience init(arrayLiteral elements: Element...) {
        self.init(array: elements)
    }

    public init(array: [Element]) {
        for element in array.reversed() {
            let node = Node(value: element, next: first)
            if first == nil {
                first = node
                last = first
            } else {
                first = node
            }
        }
    }
    
    public func insertAtBeginning(_ value: Element) {
        if first == nil {
            first = Node(value: value)
            last = first
        } else {
            let newFirst = Node(value: value, next: first)
            first = newFirst
        }
    }

    public func append(_ value: Element) {
        let node = Node(value: value)
        if let lastNode = last {
            lastNode.next = node
        } else {
            first = node
        }
        last = node
    }
}

extension LinkedList: Sequence {
    
    public struct LinkedListIterator<Element>: IteratorProtocol {
        var current: LinkedListNode<Element>?
        
        public mutating func next() -> LinkedListNode<Element>? {
            defer { current = current?.next }
            return current
        }
    }

    public func makeIterator() -> LinkedListIterator<Element> {
        return LinkedListIterator(current: first)
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        for node in self {
            s += "\(node.value)"
            if node.next != nil { s += ", " }
        }
        return s + "]"
    }
}
