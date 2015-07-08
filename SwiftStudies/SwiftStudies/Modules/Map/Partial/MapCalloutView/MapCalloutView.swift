//
//  MapCalloutView.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/8/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class MapCalloutView: BaseComponentsView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    var store:Store?
    
    func setupWithStore(store:Store) {
        self.store = store
        nameLabel.text = store.name
        latitudeLabel.text = String(store.latitude!.description)
        longitudeLabel.text = String(store.longitude!.description)
    }
    
    class func preferredSize() -> CGSize {
        return CGSizeMake(200, 100)
    }
    
}
