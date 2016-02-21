//
//  SayingHello.swift
//  
//
//  Created by Christopher Everett on 2/21/16.
//
//

import Foundation

var name: String? = nil

while (name == nil || name!.characters.count < 1) {
    print("What is your name? ", terminator:"") // terminator:"" prevents newline
    name = readLine()                           // Note that readLine returns an Optional
}
print("Hello, \(name!), nice to meet you!") // name! unwraps the Optional