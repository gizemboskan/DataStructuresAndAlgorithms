//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
var numbers = [12, 36, 87, 11 ,19, 23, 56, 78, 9, 99]

for i in 0..<numbers.count {
    
    let key = numbers[i]
    var j = i - 1
    
    while (j >= 0 && numbers[j] > key) {
        
        numbers[j+1] = numbers[j]
        j = j - 1
        
    }
    
    numbers[j+1] = key
    
}
print(numbers)

