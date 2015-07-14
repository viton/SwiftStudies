//
//  FormView.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

protocol FormViewProtocol {
    
    func setError(message:String)
    
    func setSuccess()
    
    func getValue() -> AnyObject
    
}

class FormView: BaseComponentsView {

    var validationType:Validation?
    
    func validate() -> Bool {
        if let formView = self as? FormViewProtocol {
            var value: AnyObject = formView.getValue()
            if validationType != nil {
                var result = validationType!.validate(value)
                if(result.0) {
                    formView.setSuccess()
                }else {
                    formView.setError(result.1!)
                }
                return result.0
            }
        }
        return true
    }
    
}
