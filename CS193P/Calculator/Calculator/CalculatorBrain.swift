//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Christopher Everett on 10/15/17.
//  Copyright © 2017 Christopher Everett. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double)->Double)
        case binaryOperation((Double,Double)->Double)
        case equals
        case clear
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "sin" : Operation.unaryOperation(sin),
        "tan" : Operation.unaryOperation(tan),
        "%" : Operation.unaryOperation({0.01 * $0}),
        "±" : Operation.unaryOperation({-$0}),
        "×" : Operation.binaryOperation({$0 * $1}),
        "÷" : Operation.binaryOperation({$0 / $1}),
        "−" : Operation.binaryOperation({$0 - $1}),
        "+" : Operation.binaryOperation({$0 + $1}),
        "=" : Operation.equals,
        "C" : Operation.clear,
        "1/x": Operation.unaryOperation({1/$0}),
        "x²": Operation.unaryOperation({pow($0,2)}),
        "yˣ": Operation.binaryOperation({pow($0,$1)}),
        "log": Operation.unaryOperation(log10),
        "ln": Operation.unaryOperation(log)
    ]

    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch(operation) {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            case .clear:
                accumulator = 0
                pendingBinaryOperation = nil
            }

            
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
        }
        pendingBinaryOperation = nil
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
