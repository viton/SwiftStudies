//
//  BaseComponentsView.swift
//  SwiftPOC
//
//  Created by Taqtile on 6/25/15.
//  Copyright (c) 2015 ProtocolsTesteSwift. All rights reserved.
//

import UIKit

@IBDesignable class BaseComponentsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentViewAndConstraints()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupContentViewAndConstraints()
    }
    
    
    private func setupContentViewAndConstraints() {
        let contentView:AnyObject? = NSBundle(forClass: self.dynamicType).loadNibNamed(NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!, owner: self, options: nil).first
        addSubview(contentView! as! UIView)
        addAllConstraints(contentView! as! UIView);
        customSetup()
    }
    
    private func addAllConstraints(contentView:UIView){
        var topConstraint = constraint(contentView, attribute:NSLayoutAttribute.Top);
        var bottomConstraint = constraint(contentView, attribute:NSLayoutAttribute.Bottom);
        var leadingConstraint = constraint(contentView, attribute:NSLayoutAttribute.Leading);
        var trailingConstraint = constraint(contentView, attribute:NSLayoutAttribute.Trailing);
        contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        addConstraints([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]);
    }
    
    private func constraint(contentView:UIView, attribute:NSLayoutAttribute) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item:self, attribute:attribute, relatedBy:NSLayoutRelation.Equal, toItem:contentView, attribute:attribute , multiplier:1.0, constant:0);
        return constraint
    }
    
    func customSetup() {}
    
}
