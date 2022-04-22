import UIKit

/*
 - Stack push/pop - O(1)
 - Queue
    enqueue - O(1)
    dequeue - O(n)
 */
// MARK: - Q1

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given
 
 A = [3, 8, 9, 7, 6]
 K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:
 
 [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
 [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
 [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 
 Shoot for correctness. Not performance.
 */

// rotate to right
func solutionQueueRight(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    // treat like a queue enqueuing and dequeuing off the end
    for _ in 1...K {
        let last = result.last!
        result.insert(last, at: 0)
        result.remove(at: A.count)
    }
    
    return result
}

solutionQueueRight(A: [1, 2, 3, 4, 5], K: 1) // [5, 1, 2, 3, 4]
solutionQueueRight(A: [1, 2, 3, 4, 5], K: 2) // [4, 5, 1, 2, 3]
solutionQueueRight(A: [1, 2, 3, 4, 5], K: 3) // [3, 4, 5, 1, 2]

solutionQueueRight(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]


// rotate to left
func solutionQueueLeft(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    // treat like a queue enqueuing and dequeuing off the end
    for _ in 1...K {
        let first = result.first!
        result.append(first)
        result.remove(at: 0)
    }
    
    return result
}

solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 1) // [2, 3, 4, 5, 1]
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 2) // [3, 4, 5, 1, 2]
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 3) // [4, 5, 1, 2, 3]

solutionQueueLeft(A: [3, 8, 9, 7, 6], K: 3) // [7, 6, 3, 8, 9]



// MARK: - Q2
// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */

func solution(_ text: String) -> String {
    var chars = Array(text)
    
    // create a stack
    var result = [String]()
    
    // push chars O(1)
    for c in chars {
        result.append(String(c))
    }
    
    // pop chars O(1)
    for i in 0..<result.count {
        chars[i] = Character(result.popLast()!)
    }
    return String(chars)
}

solution("abc") // bca
solution("Would you like to play a game?")


// MARK: - Q3

/*
 Balanced brackets
 https://www.hackerrank.com/challenges/balanced-brackets/problem
 
 A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].
 
 Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().
 
 A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].
 
 By this logic, we say a sequence of brackets is balanced if the following conditions are met:
 
 It contains no unmatched brackets.
 The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
 Given  strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.
 
 */

func isBalanced(s: String) -> String { // "{[()]}"
    var stack = [Character]()
    
    for c in s {
        switch c {
        case "{", "(", "[":
            stack.append(c) // O(1)
        case "}":
            if stack.isEmpty || stack.last != "{" {
                return "NO"
            }
            stack.popLast() // O(1)
        case "]":
            if stack.isEmpty || stack.last != "[" {
                return "NO"
            }
            stack.popLast() // O(1)
        case ")":
            if stack.isEmpty || stack.last != "(" {
                return "NO"
            }
            stack.popLast() // O(1)
        default:
            print("breaking \(c)")
        }
    }
    return stack.isEmpty ? "Yes" : "No"
}

isBalanced(s: "{[()]}") // Yes
isBalanced(s: "[()]}") // No
isBalanced(s: "{}()(){}((){})({[[({({(){}{}}){}})]{({()}((())))}()]})(({}(()){[][]}){()}(({}{}))())()[](){{((){})}}()([[]])[][]()({}((([()]{})())[][[()]]())){{}}[]{()}()[][]{}([])[]{({})}{}{{}{[[]]}[]{}}{[()]}[]{(([{{[{[]}]}[{}]}]))}(){}{{}}[]((([])([{(){}[(()[]((()(){})({([]({{{[]{}}[({})()({}{([()])()()[]{}})][{[]}]{{}([]({{{(()(({}[[[{{}}]]{{[()]([[{{}([[]][([{{}}(([])[][({()}())()({}[])]{}[])]())[]]){}}[]]])([]({{[[][]{[]}[]]}}{}(){[]}))}()[]((){{}()[{[[()]]}()]}[()]{})}][]{}))())}(())}{{[]}{}}({[([{[{[[[]]]{()}[]}]{}}()((({{{{({{(){}}}[[()]()[]]())({{{[]}{{[[{{[{}]}}[][]]]([][](()(()[]){{}}))([])}}}}[{}{}])[(){{()()}{(())}()}]{(){{}[]{}[][{[]([[]()]{(){[{}[()]][{}{}]{(){}}}{[]}}{[]}[]){[]}[]}][((){}{}[[[[{{}()[([({{[[][{{()}(([[]][[[[[[[{}]][{}]]]()](())[()[][]({({[][][[]{}][]}{})}{({})([[][]({}{[]})])[([([])][[]{([])(({}))}](()[]){[[]]}({}))]}[])()]]]))([{}()()([([[{}][()]][])])][[[{}][][]({[]})][(({{()}}))]])}]]}})])]}]]]])]}}}}}})))])]})}))}}}))})))]}])))") // Yes
