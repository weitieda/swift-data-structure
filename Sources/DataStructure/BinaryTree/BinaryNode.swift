//
//  BinaryNode.swift
//  Algorithms
//
//  Created by Tieda Wei on 2021-02-19.
//

import Foundation

class BinaryNode<T: Comparable>: CustomStringConvertible {
    var value: T
    var left: BinaryNode?
    var right: BinaryNode?

    init(value: T) {
        self.value = value
    }

    /// Ref:
    /// https://github.com/raywenderlich/alg-materials/blob/editions/3.0/14-binary-search-tree/projects/final/BinarySearchTree.playground/Sources/BinaryNode.swift
    var description: String {
        diagram(for: self)
    }

    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else { return root + "nil\n" }
        if node.left == nil && node.right == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.right, top + "  ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + "  ")
    }
}
