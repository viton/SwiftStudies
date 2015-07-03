//
//  AppTextField.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/3/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class AppTextField: BaseComponentsView {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet weak var disclaimerLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBInspectable var placeholder: String = "Placeholder" {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    @IBInspectable var mask: String = "" {
        didSet {

        }
    }
    
    @IBInspectable var securityEntry: Bool = false {
        didSet {
            setupSecurityEntry()
        }
    }
    
    override func customSetup() {
        textField.delegate = self
        setupNormalButton()
        setupSecurityEntry()
    }
    
    func setupSecurityEntry() {
        if(!securityEntry) { return }
        textField.secureTextEntry = true
    }
    
    func removeAllActions() {
        rightButton.removeTarget(self, action: "securityEntryTapped", forControlEvents: UIControlEvents.TouchUpInside)
        rightButton.removeTarget(self, action: "normalButtonTapped", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func setupNormalButton() {
        rightButton.addTarget(self, action: "normalButtonTapped", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func setupSecurityEntryButton() {
        rightButton.addTarget(self, action: "securityEntryTapped", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func normalButtonTapped() {
        textField.text = ""
    }
    
    func securityEntryTapped(){
        var isFirstResponder = textField.isFirstResponder()
        textField.secureTextEntry = !textField.secureTextEntry
        if(isFirstResponder) {
            textField.becomeFirstResponder()
        }
    }
    
}

extension AppTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        removeAllActions()
        setupNormalButton()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        removeAllActions()
        if(securityEntry) {
            setupSecurityEntryButton()
        }
    }
    
}

extension AppTextField:UITextFieldDelegate {
    
    internal func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var beginning = textField.beginningOfDocument;
        var cursorLocation = textField.positionFromPosition(beginning, offset: (range.location + count(string)))
        
        var selectedRange = textField.selectedTextRange
        var replacementString = string.clean()
        
        if(string == "" || mask == "") {
            return true
        }
        
        var normalText:String = textField.text
        var newString = appendString(string:string, toString:normalText, atIndex:range)
        var newStringClean = newString.clean().withMask(mask)
        
        if(newStringClean == newString){
            return true
        }
        
        textField.text = newStringClean
        var textRange = textField.textRangeFromPosition(cursorLocation, toPosition: cursorLocation)
        if(cursorLocation != nil) {
            textField.selectedTextRange = textRange
        }
        return false
    }
    
}

extension NSObject {
    
    internal func appendString(string second:String, toString first:String, atIndex index:NSRange) -> String {
        var stringResult = ""
        var chars = Array(first)
        
        if count(first) <= index.location {return first+second}
        
        for (var i = 0; i<chars.count; i++) {
            var char = chars[i]
            if(i == index.location) {
                stringResult += second
            }
            stringResult.append(char)
            
        }
        return stringResult
    }

}

extension String {
    
    internal func withMask(mask:String) -> String {
        var stringIndex:Int = 0;
        var maskIndex:Int = 0;
        var chars = Array(self)
        var maskChars = Array(mask)
        var resultString:String = ""
        while (stringIndex < chars.count && maskIndex < maskChars.count)  {
            if maskChars[maskIndex] == "#" {
                resultString.append(chars[stringIndex])
                stringIndex++
            }else{
                resultString.append(maskChars[maskIndex])
            }
            maskIndex++
        }
        return resultString
    }
    
    internal func clean() -> String {
        var stringIndex:Int = 0;
        var chars = Array(self)
        var resultString:String = ""
        for char in chars {
            if let numberChar = String(char).toInt() {
                resultString.append(char)
            }
        }
        return resultString
    }
    
    internal func maskClean() -> String {
        var stringIndex:Int = 0;
        var chars = Array(self)
        var resultString:String = ""
        for char in chars {
            if char == "#" {
                resultString.append(char)
            }
        }
        return resultString
    }
    
}