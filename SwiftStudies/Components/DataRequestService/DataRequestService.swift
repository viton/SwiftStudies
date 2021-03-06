//
//  DataRequestService.swift
//  SwiftStudies
//
//  Created by Taqtile on 6/29/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import Alamofire

class DataRequestModel: NSObject{
    
    var method:Alamofire.Method
    var url: String
    var params: AnyObject?
    var beforeResponse: () -> Void
    var success: (AnyObject) -> Void
    var failure:(AnyObject, DataRequestModel) -> Void
    var noConnection: (DataRequestModel)-> Void
    
    init(method:Alamofire.Method,
        url: String,
        params:AnyObject?,
        beforeResponse: () -> Void,
        success: (AnyObject) -> Void,
        failure:(AnyObject, DataRequestModel) -> Void,
        noConnection: (DataRequestModel)-> Void) {
        self.method = method
        self.url = url
        self.params = params
        self.beforeResponse = beforeResponse
        self.success = success
        self.failure = failure
        self.noConnection = noConnection
        super.init()
    }
    
    func repeat() {
        DataRequestService.request(self)
    }
    
}

class DataRequestService: NSObject {
   
    class func request(model: DataRequestModel) {
        request(model.method, url: model.url, params: model.params, success: model.success, failure: model.failure, noConnection: model.noConnection)
    }
    
    class func request(method:Alamofire.Method,
        url: String,
        params:AnyObject?,
        success:(AnyObject) -> Void,
        failure:(AnyObject, DataRequestModel) -> Void,
        noConnection: (DataRequestModel)-> Void ) -> Request {

        return DataRequestService.request(method, url: url, params: params, beforeResponse: { () -> Void in }, success: success, failure: failure, noConnection: noConnection)
    }
    
    class func request(method:Alamofire.Method,
        url: String,
        params:AnyObject?,
        beforeResponse: () -> Void,
        success:(AnyObject) -> Void,
        failure:(AnyObject, DataRequestModel) -> Void,
        noConnection: (DataRequestModel)-> Void ) -> Request {
            
            return Alamofire.request(method, url).response { (request, response, responseObject, error) in
                
                let model = DataRequestModel(method: method, url: url, params: params, beforeResponse: beforeResponse, success: success, failure: failure, noConnection: noConnection)
                
                beforeResponse()
                if(error != nil){
                    noConnection(model)
                }else if(response != nil){
                    let jsonString = NSString(data: responseObject as! NSData, encoding: NSUTF8StringEncoding)
                    
                    var err: NSError?
                    let data:NSData = responseObject as! NSData
                    let jsonResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as AnyObject!
                    
                    if(response?.statusCode >= 200 && response?.statusCode < 300){
                        success(jsonResult)
                    }else{
                        failure(jsonResult, model)
                    }
                }
            }
    }
    
    
}
