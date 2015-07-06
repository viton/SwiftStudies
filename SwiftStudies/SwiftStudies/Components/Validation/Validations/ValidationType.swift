//
//  ValidationType.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import Foundation

protocol ValidationType {
    
    func validate(object:AnyObject) -> (Bool, String?)
    
}

class Validation:NSObject, ValidationType {

    func validate(object:AnyObject) -> (Bool, String?) {
        return (true, nil)
    }
    
}