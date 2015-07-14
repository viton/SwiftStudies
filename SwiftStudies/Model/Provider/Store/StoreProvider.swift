//
//  StoreProvider.swift
//  SwiftStudies
//
//  Created by Taqtile on 7/7/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

protocol StoreProviderCallback: BaseProviderCallback {
    
    func onSuccessStores(stores: Array<Store>)
    
}

class StoreProvider: NSObject {
   
    class func getAllStores(callback:StoreProviderCallback){
        DataRequestService.request(.GET, url: "http://private-64298-timesheet5.apiary-mock.com/store", params: nil,
            beforeResponse: { () in
                callback.prepareToResponse()
            }, success: { (response) in
                let stores = Mapper<Store>().mapArray(response)
                callback.onSuccessStores(stores!)
            }, failure: { (response, model) in
                callback.onFailRequest()
            }, noConnection: { (model) in
                callback.onConnectionFailToRequest(model)
            }
        )
    }
    
}
