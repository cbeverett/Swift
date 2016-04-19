//
//  RectangularRoomArea.swift
//  
//
//  Created by Christopher Everett on 4/19/16.
//
//

import Foundation

// Constants
let METER_FT_CONV_FACTOR = 0.09290304

// Function Declarations
func getNumber(prompt:String) -> Int {
    var returnValue:Int = -1
    
    while returnValue < 0 {
        print(prompt, terminator:"")
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

// Input
let length = getNumber("What is the length of the room? ")
let width = getNumber("What is the width of the room? ")

// Calculations
let area_feet = length * width
let area_meters = Double(area_feet) * METER_FT_CONV_FACTOR

// Output
print("You entered dimensions of \(length) feet by \(width) feet.")
print("The area is")
print("\(area_feet) square feet")
print("\(area_meters) square meters")