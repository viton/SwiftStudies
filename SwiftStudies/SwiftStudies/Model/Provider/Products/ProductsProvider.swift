//
//  ProductsProvider.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/6/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

protocol ProductsProviderCallback: BaseProviderCallback {
    
    func onSuccessGettingProducts(products: Array<Product>)
    
}

class ProductsProvider: NSObject {
   
    internal class func getProducts(callback: ProductsProviderCallback) {
        DataRequestService.request(.GET, url: "http://private-64298-timesheet5.apiary-mock.com/products", params: nil,
            success: { (response) in
                callback.prepareToResponse()
                let products = Mapper<Product>().mapArray(response)
                callback.onSuccessGettingProducts(products!)
            }, failure: { (response, model) in
                callback.prepareToResponse()
                callback.onFailRequest()
            }, noConnection: { (model) in
                callback.prepareToResponse()
                callback.onConnectionFailToRequest(model)
            }
        )
    }
    
}
