//
//  ViewController.swift
//  Calculator
//
//  Created by Christopher Everett on 3/3/16.
//  Copyright © 2016 Christopher Everett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var history: UILabel!

    // Properties
    var userInTheMiddleOfTypingNumber : Bool = false
    var operandStack = Array<Double>()

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userInTheMiddleOfTypingNumber = true
        }
    }

    @IBAction func clear() {
        operandStack.removeAll()
        history.text = " "
        userInTheMiddleOfTypingNumber = false
        display.text = "0"
    }
    
    @IBAction func enter() {
        appendHistory(" \(display.text!)")
        operandStack.append(displayValue)
        userInTheMiddleOfTypingNumber = false
    }
    
    @IBAction func point() {
        if display.text!.rangeOfString(".") == nil {
            userInTheMiddleOfTypingNumber = true
            display.text = display.text! + "."
        }
    }
    
    @IBAction func back() {
        display.text!.removeAtIndex(display.text!.endIndex.predecessor())
        if display.text!.characters.count == 0 {
            display.text = "0"
            userInTheMiddleOfTypingNumber = false
        }
    }
    
    @IBAction func appendOperand(sender: UIButton) {
        let operand = sender.currentTitle!
        if userInTheMiddleOfTypingNumber {
            enter()
        }
        switch(operand) {
            case "π":
                let pie = M_PI
                display.text = "\(pie)"
                operandStack.append(pie)
            default:break
        }
        appendHistory(" \(operand)")
        userInTheMiddleOfTypingNumber = false
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userInTheMiddleOfTypingNumber {
            if operation == "+∕-" {
                displayValue = displayValue * -1
                return
            }
            else {
                enter()
            }
        }
        appendHistory(" \(operation) =")
        switch(operation) {
            case "×":
                performOperation { $0 * $1 }
            case "÷":
                performOperation { $1 / $0 }
            case "+":
                performOperation { $0 + $1 }
            case "−":
                performOperation { $1 - $0 }
            case "√":
                performOperation { sqrt($0) }
            case "sin":
                performOperation { sin($0) }
            case "cos":
                performOperation { cos($0) }
            case "+∕-":
                performOperation { -1 * $0 }
            default:break
        }
        
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            operandStack.append(displayValue)
            userInTheMiddleOfTypingNumber = false
        }
    }
    
    @nonobjc  // Necessary for method overloading
    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            operandStack.append(displayValue)
            userInTheMiddleOfTypingNumber = false
        }
    }
    
    func appendHistory(histStr: String) {
        if history.text == nil {
            history.text = histStr
        }
        else {
            history.text! += histStr
        }
    }
    
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userInTheMiddleOfTypingNumber = false
        }
    }

}

