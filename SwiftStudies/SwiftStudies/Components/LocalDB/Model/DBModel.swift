//
//  DBModel.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/7/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class DBModel<T, K>: NSObject {
   
    func find(key:K) -> T? {
        return nil
    }
    
    func findAll() -> [T] {
        return []
    }
    
    func persist(object:T) -> T {
        return object
    }
    
    
    
}
