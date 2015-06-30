//
//  ProjectsProvider.swift
//  SwiftStudies
//
//  Created by Taqtile on 6/26/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

protocol BaseProviderCallback {

    func onConnectionFailToRequest(model: DataRequestModel);
    
    func onFailRequest();
}

protocol ProjectsProviderCallback: BaseProviderCallback {
    
    func didReceiveProjects(timesheetOptions:TimesheetOptions);
    
}

class ProjectsProvider: NSObject {
   
    internal class func getProjects(callback: ProjectsProviderCallback) {

        DataRequestService.request(.GET, url: "http://private-64298-timesheet5.apiary-mock.com/projects", params: nil,
            success: { (response) in
                let timesheetOptions = Mapper<TimesheetOptions>().map(response)
                
                callback.didReceiveProjects(timesheetOptions!)
                
                
            }, failure: { (response, model) in
                callback.onFailRequest()
            }, noConnection: { (model) in
                callback.onConnectionFailToRequest(model)
            }
        )
    }
    
}
