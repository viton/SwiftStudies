//
//  StoreTableManager.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/10/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class StoreTableManager: BaseTableViewManager {
   
    override func cellClasses() -> Array<AnyClass> {
        return [StoreTableViewCell.classForCoder()]
    }
    
    override func setData(item: AnyObject, toCell cell: UITableViewCell) {
        if let store = item as? Store {
            if let storeCell = cell as? StoreTableViewCell {
                storeCell.nameLabel.text = store.name
                storeCell.latLabel.text = store.latitude?.description
                storeCell.lngLabel.text = store.longitude?.description
                
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
}
