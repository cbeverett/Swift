//
//  CountingCharacters.swift
//  
//
//  Created by Christopher Everett on 2/21/16.
//
//

import Foundation

var inputStr: String? = nil

while (inputStr == nil || inputStr!.characters.count < 1) {
    print("What is the input string? ", terminator:"")
    inputStr = readLine()
}

print("\(inputStr!) has \(inputStr!.characters.count) characters.")
