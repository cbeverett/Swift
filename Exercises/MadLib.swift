//
//  MadLib.swift
//  
//
//  Created by Christopher Everett on 4/17/16.
//
//

import Foundation

var words: [String:String?] = ["noun":nil, "verb":nil, "adjective":nil, "adverb":nil]

for(wordtype,_) in words {
    var wordvalue: String? = nil
    while(wordvalue == nil || wordvalue!.characters.count < 1) {
        print("Enter a \(wordtype): ", terminator:"")
        wordvalue = readLine()
    }
    words[wordtype] = wordvalue
}

// Note the double unwrap (!!).  This is because the dictionary subscript syntax returns an Optional because
// the key may not exist in the dictionary.  The first (!) takes care of that.  The second (!) is necessary 
// because our actual dictionary values are also Optionals.
print("Do you \(words["verb"]!!) your \(words["adjective"]!!) \(words["noun"]!!) \(words["adverb"]!!)?  That's hilarious!")

