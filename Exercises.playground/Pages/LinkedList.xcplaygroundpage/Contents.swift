import UIKit

// MARK: - Q1
/*
 Write a function that determines the length of any linked list.
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    
    if head == nil {
        return 0
    }
    
    var lenght = 0
    var current = head
    
    while current != nil {
        lenght += 1
        current = current?.next
    }
    
    return lenght
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

length(nil) // 0
length(node1) // 6


// MARK: - Q2

/*
 Find Merge Point of Two Lists
 
 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.
 
 Note: After the merge point, both lists will share the same node pointers.
 
 */

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

// Brute force solution O(n^2)
func findMerge(headA: Node?, headB: Node?) -> Int? { // O(n^2)
    
    let lenghtA = length(headA) // O(n)
    let lenghtB = length(headB) // O(n)
    
    var currentA = headA
    
    for _ in 0...lenghtA - 1 { // O(n)
        var currentB = headB
        for _ in 0...lenghtB - 1 { // O(n)
            let A = currentA?.data
            let B = currentB?.data
            if A == B {
                return A
            }
            currentB = currentB?.next
        }
        currentA = currentA?.next
    }
    return nil
}

// solution by caring space - time
func findMergeSpaceTime(headA: Node?, headB: Node?) -> Int? {
    // Create a dict of all nodes of B
    // use it to loop up each element of A
    let lenghtA = length(headA) // O(n)
    let lenghtB = length(headB) // O(n)
    
    var dict = [Int? : Bool]()
    var currentB = headB
    for _ in 0...lenghtB - 1 { // O(n)
        let B = currentB?.data
        dict[B] = true
        currentB = currentB?.next
    }
    
    var currentA = headA
    for _ in 0...lenghtA - 1 { // O(n)
        let A = currentA?.data
        if dict[A] == true {
            return A
        }
        currentA = currentA?.next
    }
    
    return nil
}

func findMergeInsight(headA: Node?, headB: Node?) -> Int? { // O(n)
    // figure out which is longer
    // swap if necessary
    
    // calculate d
    // walk d for longer
    // walk remainder for both
    let lenghtA = length(headA) // O(n)
    let lenghtB = length(headB) // O(n)
    
    var currentA = headA
    var currentB = headB
    
    if lenghtB > lenghtA {
        let temp = currentA
        currentA = currentB
        currentB = temp
    }
    
    let d = abs(lenghtA - lenghtB)
    
    for _ in 1...d { // O(n)
        currentA = currentA?.next
    }
    
    for _ in 1...lenghtB - 1 { // O(n)
        let A = currentA?.data
        let B = currentB?.data
        
        if A == B {
            return A
        }
        currentA = currentA?.next
        currentB = currentB?.next
    }
    
    return nil
}

// 1 2 3 4 5 6 - over the page

// 10 11 12 13 4 5 6
let node11 = Node(11, node4)
let node10 = Node(10, node11)

printLinkedList(node1)
printLinkedList(node10)

findMerge(headA: node1, headB: node10)
findMergeSpaceTime(headA: node1, headB: node10)
findMergeInsight(headA: node1, headB: node10)
findMergeInsight(headA: node10, headB: node1)


// MARK: - Q3
/*
 Detect A Cycle
 https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
 https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
 
 A linked list is said to contain a cycle if any node is visited more than once while traversing the list. For example, in the following graph there is a cycle formed when node 5 points back to node 3.
 
        4
      /   \
 1 2 3      5
     \_____/
 
 */


func hasCycle(first: Node) -> Bool {
    
    var slow: Node? = first
    var fast: Node? = first
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.data == fast?.data {
            return true
        }
    }
    return false
}

let head = Node(1)

head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node3

hasCycle(first: head)
