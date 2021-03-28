//
//  LinkedList.swift
//  Algorithms
//
//  Created by Tieda Wei on 2021-02-06.
//

import Foundation

public class LinkedList<T: Comparable> {

    public typealias Node = LinkedListNode<T>

    final public class LinkedListNode<T> {
        public var value: T
        public var next: LinkedListNode?

        public init(value: T, next: LinkedListNode? = nil) {
            self.value = value
            self.next = next
        }
    }

    public private(set) var head: Node?

    public var last: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }

    public convenience init(array: [T]) {
        self.init()

        guard let first = array.first else { return }
        
        var node = Node(value: first)
        
        append(node)
        
        for value in array[1...] {
            let nextNode = Node(value: value)
            node.next = nextNode
            node = nextNode
        }
    }

    public func append(_ value: T) {
        append(Node(value: value))
    }

    public func append(_ node: Node) {
        if let lastNode = last {
            lastNode.next = node
        } else {
            head = node
        }
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while let nd = node {
            s += "\(nd.value)"
            node = nd.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}
