//
//  TimesheetOptions.swift
//  SwiftStudies
//
//  Created by Taqtile on 6/30/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import ObjectMapper

class TimesheetOptions: NSObject, Mappable {
   
    var projects:[Project]?
    var tasks:[Task]?
    
    override init() {}
    
    required init?(_ map: Map) {
        super.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        projects <- map["projects"]
        tasks <- map["tasks"]
    }
    
}
