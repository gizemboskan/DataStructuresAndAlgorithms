//: [Previous](@previous)

import Foundation


//: [Next](@next)

// LIF0
struct Stack<Element> {
    private var storage: [Element] = []
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    init() {}
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        
        let topDivider = "----top-----\n"
        let bottomDivider = "\n---------"
        
        let stackElements = storage.map { "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()

stack.push(20)
stack.push(10)
stack.push(3)
stack.push(99)

print("before popping")
print(stack)

print("after popping")
stack.pop()
print(stack)

