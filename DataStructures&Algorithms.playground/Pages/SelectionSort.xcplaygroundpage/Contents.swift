//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
var numbers = [2, 6, 7, 11 ,19, 23, 56, 78, 9]

print("before the sorting")
print(numbers)

var minIndex = 0

for i in 0..<numbers.count {
    
    minIndex = i
    
    for j in (i+1)..<numbers.count {
        
        if (numbers[j] < numbers[minIndex]) {
            minIndex = j
        }
        numbers.swapAt(i, minIndex)
        
        // swap the values
        //        let temp = numbers[i]
        //        numbers[i] = numbers[minIndex]
        //        numbers[minIndex] = temp
    }
}

print("after sorting")
print(numbers)
