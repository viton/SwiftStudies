//
//  MapPin.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/8/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import MapKit

class MapPin: NSObject, MKAnnotation {

    let title: String
    let coordinate: CLLocationCoordinate2D
    var store:Store?
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }

}
