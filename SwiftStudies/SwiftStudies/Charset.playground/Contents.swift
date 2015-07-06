//: Playground - noun: a place where people can play

import UIKit

var name = "Márcia"

var lettersCharsSet:NSCharacterSet = NSCharacterSet.alphanumericCharacterSet()
var nameNS = NSString(string: name)
println(nameNS)

if (nameNS.rangeOfCharacterFromSet(lettersCharsSet.invertedSet).location != NSNotFound) {
    println("HAS SPECIAL CHARS")
    println(nameNS.rangeOfCharacterFromSet(lettersCharsSet.invertedSet).location)
}