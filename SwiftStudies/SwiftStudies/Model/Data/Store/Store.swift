//
//  Store.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/7/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import ObjectMapper

class Store: NSObject, Mappable {
   
    var name:String?
    var latitude:Double?
    var longitude:Double?
    
    override init() {}
    
    required init?(_ map: Map) {
        super.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
    
}
