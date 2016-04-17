//
//  PrintingQuotes.swift
//  
//
//  Created by Christopher Everett on 4/17/16.
//
//

import Foundation

var quote: String? = nil
var source: String? = nil

while(quote == nil || quote!.characters.count < 1) {
    print("What is the quote? ", terminator:"")
    quote = readLine()
}

while(source == nil || source!.characters.count < 1) {
    print("Who said it? ", terminator:"")
    source = readLine()
}

print("\(source!) says, \"\(quote!)\"")
