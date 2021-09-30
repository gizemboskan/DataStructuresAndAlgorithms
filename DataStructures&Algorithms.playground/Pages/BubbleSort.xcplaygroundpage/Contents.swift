//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var numbers = [2, 6, 7, 11 ,19, 23, 56, 78, 9]

print("before the sorting")
print(numbers)

for i in 0..<numbers.count {
    
    for j in 0..<numbers.count {
        
        // to sort as ascending:
        if(numbers [i] > numbers[j]) {
            
            numbers.swapAt(i,j)
            // swap the numbers
//            let temp = numbers[i]
//            numbers[i] = numbers[j]
//            numbers[j] = temp
        }
    }
}
print("after sorting")
print(numbers)

