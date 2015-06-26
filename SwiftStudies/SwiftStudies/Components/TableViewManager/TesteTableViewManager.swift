//
//  TesteTableViewManager.swift
//  SwiftPOC
//
//  Created by Taqtile on 6/24/15.
//  Copyright (c) 2015 ProtocolsTesteSwift. All rights reserved.
//

import UIKit

class TesteTableViewManager: BaseTableViewManager {
   
    override func setData(item: AnyObject, toCell cell: UITableViewCell) {
        var testCell = cell as! NewTableViewCell
        testCell.cellBigName.text = item.description;
    }
    
    override func cellClasses() -> Array<AnyClass> {
        return [NewTableViewCell.classForCoder()];
    }
    
    
    
}
