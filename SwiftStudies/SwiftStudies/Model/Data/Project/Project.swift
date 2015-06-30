//
//  Project.swift
//  SwiftStudies
//
//  Created by Taqtile on 6/30/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import ObjectMapper

class Project: NSObject, Mappable {
   
    var name:String?
    var id:String?
    
    override init() {}
    
    required init?(_ map: Map) {
        super.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }
    
}
