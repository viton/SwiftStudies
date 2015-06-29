//
//  ProjectsProvider.swift
//  SwiftStudies
//
//  Created by Taqtile on 6/26/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import Alamofire

protocol ProjectsProviderCallback {
    
    func didReceiveProjects();
    
    func onFailGetProjects();
    
    func didFailConnection();
    
}

class ProjectsProvider: NSObject {
   
    internal class func getProjects(callback: ProjectsProviderCallback) {
        Alamofire.request(.GET, "http://private-64298-timesheet5.apiary-mock.com/projects").response { (request, response, responseObject, error) in
            if(error != nil){
                callback.didFailConnection()
            }else if(response != nil){
                let jsonString = NSString(data: responseObject as! NSData, encoding: NSUTF8StringEncoding)
                
                var err: NSError?
                let data:NSData = responseObject as! NSData
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
                
                if(response?.statusCode >= 200 && response?.statusCode < 300){
                    callback.didReceiveProjects()
                }else{
                    callback.onFailGetProjects()
                }
            }
        }
    }
    
}
