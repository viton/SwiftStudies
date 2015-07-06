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

protocol ProjectsProviderCallback: BaseProviderCallback {
    
    func didReceiveProjects(timesheetOptions:TimesheetOptions);
    
}

class ProjectsProvider: NSObject {
   
    internal class func getProjects(callback: ProjectsProviderCallback) {

        DataRequestService.request(.GET, url: "http://private-64298-timesheet5.apiary-mock.com/projects", params: nil,
            success: { (response) in
                let timesheetOptions = Mapper<TimesheetOptions>().map(response)
                callback.prepareToResponse()
                callback.didReceiveProjects(timesheetOptions!)
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
