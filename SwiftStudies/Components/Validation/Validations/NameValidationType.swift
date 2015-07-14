//
//  NameValidationType.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class NameValidationType: Validation {

    override func validate(object: AnyObject) -> (Bool, String?) {
        var result = true
        var message:String?
        
        var lettersCharsSet:NSCharacterSet = NSCharacterSet.alphanumericCharacterSet()
        var numberCharsSet:NSCharacterSet = NSCharacterSet(charactersInString: "0123456789")
        
        
        if let name = object as? String {
            var nameClean:NSString = NSString(string:name).stringByReplacingOccurrencesOfString(" ", withString: "")
            if ((nameClean.rangeOfCharacterFromSet(lettersCharsSet.invertedSet).location != NSNotFound)
            &&  (nameClean.rangeOfCharacterFromSet(numberCharsSet).location != NSNotFound)){
                result = false
                message = "Caracteres inválidos"
            }
            
            if(count(name) <= 2) {
                result = false
                message = "Texto muito curto"
            }
        }

        return (result, message)
    }
    
}
