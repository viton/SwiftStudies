//
//  EmailValidationType.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class EmailValidationType: Validation {
 
    override func validate(object: AnyObject) -> (Bool, String?) {
        var result = false
        var message:String?
        
        if let email = object as? String {
            let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            result = emailTest.evaluateWithObject(email)
            if(!result) {
                message = "Invalid Email"
            }
        }
        
        
        return (result, message)
    }
    
}
