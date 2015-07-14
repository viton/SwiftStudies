//
//  CPFValidationType.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class CPFValidationType: Validation {

    override func validate(object: AnyObject) -> (Bool, String?) {
        var result = false
        var message:String?
        if let cpf = object as? String {
            var cpfClean = cpf.clean()
            if(count(cpfClean) == 11) {
                result = true
            }else {
                message = "CPF inválido"
            }
        }
        return (result, message)
    }
    
}
