//
//  Product.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import ObjectMapper

class Product: NSObject, Mappable {
   
    var name:String?
    var price:String?
    var image:String?
    
    override init() {}
    
    required init?(_ map: Map) {
        super.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        price <- map["price"]
        image <- map["image"]
    }
    
}
