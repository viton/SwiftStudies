//
//  RegisterViewController.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/3/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var cpField: AppTextField!
    @IBOutlet weak var zipcodeField: AppTextField!
    @IBOutlet weak var passwordField: AppTextField!
    @IBOutlet weak var emailField: AppTextField!
    @IBOutlet weak var containerForForms: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFields()
    }
    
    func setupFields() {
        cpField.validationType = CPFValidationType()
        zipcodeField.validationType = ZipCodeValidationType()
        passwordField.validationType = NameValidationType()
        emailField.validationType = EmailValidationType()
    }

    @IBAction func buttonAction(sender: AnyObject) {
        println(containerForForms.validateAllForms())
    }

}

extension UIView {
    
    func validateAllForms() -> Bool {
        var numberOfFormViews:Int = 0
        var numberOfValidations:Int = 0
        
        for view in subviews {
            if let formView = view as? FormView {
                numberOfFormViews++
                if(formView.validate()){
                    numberOfValidations++
                }
            }
        }
        return numberOfValidations == numberOfFormViews
    }
    
}
