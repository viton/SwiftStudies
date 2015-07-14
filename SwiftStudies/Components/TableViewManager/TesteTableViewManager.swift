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
        let testCell = cell as! NewTableViewCell
        let project = item as! Project
        testCell.cellBigName.text = project.name!;
    }
    
    override func cellClasses() -> Array<AnyClass> {
        return [NewTableViewCell.classForCoder()];
    }
    
    
    
}
