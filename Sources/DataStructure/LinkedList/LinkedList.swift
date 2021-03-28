//
//  LinkedList.swift
//  Algorithms
//
//  Created by Tieda Wei on 2021-02-06.
//

import Foundation

final class LinkedList<T: Comparable> {

    typealias Node = LinkedListNode<T>

    final class LinkedListNode<T> {
        var value: T
        var next: LinkedListNode?

        init(value: T, next: LinkedListNode? = nil) {
            self.value = value
            self.next = next
        }
    }

    private(set) var head: Node?

    var last: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }

    convenience init(array: [T]) {
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

    func append(_ value: T) {
        append(Node(value: value))
    }

    func append(_ node: Node) {
        if let lastNode = last {
            lastNode.next = node
        } else {
            head = node
        }
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
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
