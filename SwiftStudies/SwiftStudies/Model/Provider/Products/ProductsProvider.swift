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
            beforeResponse: { () in
                callback.prepareToResponse()
            }, success: { (response) in
                let products = Mapper<Product>().mapArray(response)
                callback.onSuccessGettingProducts(products!)
            }, failure: { (response, model) in
                callback.onFailRequest()
            }, noConnection: { (model) in
                callback.onConnectionFailToRequest(model)
            }
        )
    }
    
}
