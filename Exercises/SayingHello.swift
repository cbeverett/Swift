//
//  SayingHello.swift
//  
//
//  Created by Christopher Everett on 2/21/16.
//
//

import Foundation

print("What is your name? ", terminator:"") // terminator:"" prevents newline
let name: String? = readLine()              // Note that readLine returns an Optional
print("Hello, \(name!), nice to meet you!") // name! unwraps the Optional