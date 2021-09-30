//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let numbers = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]


extension Array where Iterator.Element == Int {
    
    func containsUsingBinarySearch(_ value: Int) -> Bool {
        
        // left side of the array
        var lowerBound = 0
        var upperBound = numbers.count - 1
        var middle = 0
        var found = false
        while(lowerBound <= upperBound) {
            
            // find the middle of the array
            middle = (lowerBound + upperBound) / 2
            
            if (numbers[middle] == value) {
                
                found = true
                break
            }else if (numbers[middle] < value) {
                lowerBound = middle + 1
                
            } else {
                upperBound = middle - 1
                
            }
        }
        return found
    }
}

print(numbers.containsUsingBinarySearch(31))
