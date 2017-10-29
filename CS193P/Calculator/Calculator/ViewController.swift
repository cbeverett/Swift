//
//  ViewController.swift
//  Calculator
//
//  Created by Christopher Everett on 10/12/17.
//  Copyright © 2017 Christopher Everett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let displayCharWidth = 12
    
    var userInMiddleOfTyping = false
    
    private var brain = CalculatorBrain()
    
    @IBOutlet weak var display: UILabel!
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            
            let newValueString = newValue == floor(newValue) ? String(Int(newValue)) : String(newValue)
            //let newValueString = String(newValue)
            if newValueString.count > displayCharWidth {
                let subStrIndex = newValueString.index(newValueString.startIndex, offsetBy: displayCharWidth)
                display.text = String(newValueString[...subStrIndex])
            }
            else {
                display.text = newValueString
            }
        }
    }

    @IBAction func touchDecimal(_ sender: UIButton) {
        
        if userInMiddleOfTyping {
            if let textCurrentlyInDisplay = display.text{
                if !textCurrentlyInDisplay.contains(".") &&
                    textCurrentlyInDisplay.count <= displayCharWidth {
                    display.text = textCurrentlyInDisplay + "."
                }
            }
        }
        else {
            display!.text = "0."
            userInMiddleOfTyping = true
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userInMiddleOfTyping {
            if let textCurrentlyInDisplay = display.text{
                if textCurrentlyInDisplay.count <= displayCharWidth {
                    display.text = textCurrentlyInDisplay + digit
                }
            }
        }
        else {
            display!.text = digit
            userInMiddleOfTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userInMiddleOfTyping {
            brain.setOperand(displayValue)
            userInMiddleOfTyping = false
        }

        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
            
        }
    }
}

