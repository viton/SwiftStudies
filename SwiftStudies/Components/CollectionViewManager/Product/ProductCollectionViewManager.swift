//
//  ProductCollectionViewManager.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/7/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class ProductCollectionViewManager: CollectionViewManager {
   
    override func setData(item: AnyObject, toCell cell: UICollectionViewCell) {
        if let productCell = cell as? ProductCollectionViewCell {
            if let product = item as? Product {
                productCell.nameLabel.text = product.name
                productCell.priceLabel.text = product.price
                productCell.productImageView.setImage(url: product.image!)
            }
        }
    }
    
    override func cellClasses() -> Array<AnyClass> {
        return [ProductCollectionViewCell.classForCoder()]
    }
    
}

extension ProductCollectionViewManager: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width-2)/2, height: 210)
    }
    
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2.0
    }
    
}
