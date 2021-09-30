import UIKit

var greeting = "Hello, playground"

struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ value: Value) {
        
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    func node(at index: Int) -> Node<Value>? {
        
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
        
    }
    
    func insert(value: Value, after node: Node<Value>?){
        node?.next = Node(value: value, next: node?.next)
    }
    
    mutating func append(_ value: Value){
        
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    
    mutating func pop() -> Value? {
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while  let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value?{
        
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
            
        }
        return node.next?.value
    }
    
    
    
    init() { }
}
// allows us to obtain nicely printed linked list!
extension LinkedList: CustomStringConvertible {
    
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}


class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    var description: String{
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ""
    }
}

//let node1 = Node(value: 1)
//let node2 = Node(value: 2)
//let node3 = Node(value: 3)
//
//node1.next = node2
//node2.next = node3


var list = LinkedList<Int>()

//list.push(2)
//list.push(3)
//list.push(22)


list.append(10)
list.append(3)
list.append(12)
list.append(100)


//print(list)
//
//let middleNode = list.node(at: 1)
//
//list.insert(value: 999, after: middleNode)
//print(list)


//print("Before popping list")
//print(list)
//
//print("After popping list")
//list.pop()
//print(list)



//print("Before removing last")
//print(list)
//
//print("After removing last")
//list.removeLast()
//print(list)



//print("Before removing")
print(list)
let index = 1
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)

print("After removing")
print(list)
