//
//  ZipCodeValidationType.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class ZipCodeValidationType: Validation {
   
    override func validate(object: AnyObject) -> (Bool, String?) {
        var result = false
        var message:String?
        
        if let zipcode = object as? String {
            var zipcodeClean = zipcode.clean()
            if(count(zipcodeClean) == 8) {
                result = true
            }else {
                message = "CEP Inválido"
            }
        }
        
        
        return (result, message)
    }
    
}
