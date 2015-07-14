//
//  ProductsViewController.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class ProductsViewController: BaseViewController, ProductsProviderCallback {

    @IBOutlet weak var collectionView: UICollectionView!
    var collectionManager:CollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionManager = ProductCollectionViewManager(collectionView: collectionView, delegate: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        requestProducts()
    }
    
    func requestProducts() {
        view.startLoading()
        ProductsProvider.getProducts(self)
    }
    
}

extension ProductsViewController: ProductsProviderCallback {
    
    override func prepareToResponse() {
        super.prepareToResponse()
        view.stopLoading()
    }
    
    func onSuccessGettingProducts(products: Array<Product>) {
        collectionManager?.updateWithData(products)
    }
    
}