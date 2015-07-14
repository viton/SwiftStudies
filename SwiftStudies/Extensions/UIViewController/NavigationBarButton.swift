//
//  NavigationBarButton.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/3/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

extension UIViewController {
    
    internal func addBackBarButton() {
        addLeftNavigationBarButton(image: "ic-back", action: "backButtonTapped")
    }
    
    internal func addLeftNavigationBarButton(title titleText:String, action:Selector) {
        var button = barButtonItem(title: titleText, action: action)
        addLeftNavigationBarButton(button)
    }
    
    internal func addRightNavigationBarButton(title titleText:String, action:Selector) {
        var button = barButtonItem(title: titleText, action: action)
        addRightNavigationBarButton(button)
    }
    
    internal func addLeftNavigationBarButton(image imageName:String, action:Selector) {
        var button = barButtonItem(imageName, action: action)
        addLeftNavigationBarButton(button)
    }
    
    internal func addRightNavigationBarButton(image imageName:String, action:Selector) {
        var button = barButtonItem(imageName, action: action)
        addRightNavigationBarButton(button)
    }
    
    private func addRightNavigationBarButton(button:UIBarButtonItem) {
        self.navigationItem.rightBarButtonItem = button
    }
    
    private func addLeftNavigationBarButton(button:UIBarButtonItem) {
        self.navigationItem.leftBarButtonItem = button
    }
    
    private func barButtonItem(imageName:String, action:Selector) -> UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: imageName), style: UIBarButtonItemStyle.Plain, target: self, action: action)
    }
    
    private func barButtonItem(title titleText:String, action:Selector) -> UIBarButtonItem {
        return UIBarButtonItem(title: titleText, style: UIBarButtonItemStyle.Plain, target: self, action: action)
    }
    
}
