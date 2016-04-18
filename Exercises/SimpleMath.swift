//
//  SimpleMath.swift
//  
//
//  Created by Christopher Everett on 4/17/16.
//
//

import Foundation

func getNumber(name:String) -> Int {
    var returnValue:Int = -1
    
    while returnValue < 0 {
        print("What is the \(name) number? ", terminator:"")
        let text = readLine()
        if let number = NSNumberFormatter().numberFromString(text!) {
            if number.intValue >= 0 {
                returnValue = number.integerValue
            }
            else {
                print("Negative numbers not allowed.")
            }
        }
        else {
            print("\(text!) is not a number.")
        }
    }
    
    return returnValue
}

let first: Int = getNumber("first")
let second: Int = getNumber("second")

// operations is a list of tuples that include the name of the operation and a closure capturing the operation
var operations : [(String, (Int, Int) -> Int)] = [("+", {$0 + $1}), ("-", {$0 - $1}), ("*", {$0 * $1}), ("/",{$0 / $1}) ]

for (opname, operation) in operations {
    let result = operation(first,second)
    print("\(first) \(opname) \(second) = \(result)")
}



