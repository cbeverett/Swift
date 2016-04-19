//
//  RetirementCalculator.swift
//  
//
//  Created by Christopher Everett on 4/18/16.
//
//

import Foundation

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

func getCurrentYear() -> Int {
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components([.Day, .Month, .Year], fromDate: date)
    
    let year = components.year
    // components.month and components.day not used here, but will be useful later
    
    return year
}

// Input
let currentAge = getNumber("What is your current age? ")
let retirementAge = getNumber("At what age would you like to retire? ")

// Calculations
let currentYear = getCurrentYear()
let workYears = retirementAge - currentAge
let retirementYear = currentYear + workYears

// Output
if currentAge >= retirementAge {
    print("Go ahead and retire...What are you waiting for?")
}
else {
    print("You have \(workYears) years left until you can retire.")
    print("It's \(currentYear), so you can retire in \(retirementYear).")
}



