import UIKit

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
 
 */

func solution(A: [Int], K: Int) -> [Int] {
    // to try edge cases
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    for _ in 1...K { // O(n)
        result = rotateRightOnce(A: result)
    }
    
    return result
}

private func rotateRightOnce(A: [Int]) -> [Int] {
    let x = A.count
    var newArray = Array<Int>(repeating: 0, count: x)
    
    for i in 0..<x - 1 { // O(n)
        newArray[i + 1] = A[i]
    }
    
    newArray[0] = A.last!
    
    return newArray
}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2
solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]


// MARK: - Q2

/*
 We are given a string S representing a phone number, which we would like to reformat. String S consists of N characters: digits, spaces, and/or dashes. It contains at least two digits.
 
 Spaces and dashes in string S can be ignored. We want to reformat the given phone number is such a way that the digits are grouped in blocks of length three, separated by single dashes. If necessary, the final block or the last two blocks can be of length two.
 
 For example:
 
 S = "00-44   48 5555 8361" should become
 "004-448-555-583-61"
 
 Assume:
 - S consists only of digits (0-9), spaces, and/or dashses (-)
 - S containts at least two digits
 
 Translate:
 
 Would like to reformat a phone number string so that:
 - every third char is a "-"
 - spaces and dashes don't matter
 - if the block ends in anything other than -xxx or -xx reformat to a block of two like xx-xx (not obvious)
 
 */

func solution(_ S : String) -> String {
    let onlyString = S.replacingOccurrences(of: "-", with: "")
    let onlyStringRemoveWhiteSpaces = onlyString.replacingOccurrences(of: " ", with: "")
    
    var result = ""
    var count = 1
    
    for c in onlyStringRemoveWhiteSpaces {
        result.append(c)
        if count % 3 == 0 {
            result.append(contentsOf: "-")
        }
        count += 1
    }
    
    if result.last == "-" {
        result = String(result.dropLast())
    }
    
    // if second last char has a dash (-x)
    // reformat last three chars to (-xx)
    var chars = Array(result)
    let secondLastPointer = chars.count-2
    if chars[secondLastPointer] == "-" {
        chars[secondLastPointer] = chars[secondLastPointer-1]
        chars[secondLastPointer-1] = "-"
    }
    
    return String(chars)
}

solution("123456789")           // 123-456-789
solution("555372654")           // 555-372-654
solution("0 - 22 1985--324")    // 022-198-53-24

// Edge cases
solution("01")                          // 01
solution("012")                         // 012
solution("0123")                        // 01-23
solution("0123       444")              // 012-34-44
solution("------0123       444")        // 012-34-44



// MARK: - Q3

/*
 When someone searches their contacts based on a phone number, it's nice when a list
 of contact pops up.
 
 Write an algorithm that searches you contacts for phone number strings, and returns:
 - NO CONTACT if contact can't be found
 - A contact if a contact is found
 - The first alphabetized contact if there are multiple
 
 A = ["pim", "pom"]             // Contacts (return one of these)
 B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
 P = "88999"                    // Search phrase
 
 Answer should be correct. Don't worry about performance.
 */

func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    
    return solutionDict(A, B, P)
    
}

private func solutionDict(_ A : [String], _ B : [String], _ P : String) -> String {
    
    var result = [String]()
        
    for i in 0..<B.count {
        if B[i].contains(P) {
            result.append(A[i])
        }
    }
    
    if result.count == 0 {
        return "No contact!"
    } else if result.count == 1 {
        return result.first!
    }
    
    // sort and return first
    return result.sorted().first!
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P)   // pom
solution(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")   // NO CONTACT

// edge cases
solution([String](), [String](), "")
solution(A, B, "")
