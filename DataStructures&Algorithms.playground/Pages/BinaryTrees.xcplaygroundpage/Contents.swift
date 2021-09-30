//: [Previous](@previous)

import UIKit

var greeting = "Hello, playground"

//: [Next](@next)

class BinaryNode<Element>{
    
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    func traversalPostOrder(visit: (Element) -> Void) {
        
        leftChild?.traversalPostOrder(visit: visit)
        rightChild?.traversalPostOrder(visit: visit)
        visit(value)
    }
    
    func traversalInOrder(visit: (Element) -> Void) {
        
        leftChild?.traversalInOrder(visit: visit)
        visit(value)
        rightChild?.traversalInOrder(visit: visit)
    }
    
    func traversalPreOrder(visit: (Element) -> Void) {
        
        visit(value)
        leftChild?.traversalPreOrder(visit: visit)
        rightChild?.traversalPreOrder(visit: visit)

    }
}

let ten = BinaryNode(10)
let nine = BinaryNode(9)
let two = BinaryNode(2)
let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)

ten.leftChild = nine
ten.rightChild = two
nine.leftChild = one
nine.rightChild = three
two.leftChild = four
two.rightChild = six

ten.traversalInOrder {
    print($0)
}

