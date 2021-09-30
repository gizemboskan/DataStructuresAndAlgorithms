//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


func factorial(number: Int) -> Int {
    
    // base case
    if number == 0 {
        return 1
    }
    // recursive case
    return number * factorial(number: number - 1)
}

let result = factorial(number: 6)
print(result)


/*
 
 Stack
 
 
*/


func power(num: Int, n: Int) -> Int {
    
    // base case
    if n == 0 {
        return 1
    }
    // recursive case
    else {
        return num * power(num: num, n: n-1)
    }
    
}

print(power(num:2, n:3))
