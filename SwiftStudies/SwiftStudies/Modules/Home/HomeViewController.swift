//
//  HomeViewController.swift
//  SwiftPOC
//
//  Created by Taqtile on 6/19/15.
//  Copyright (c) 2015 ProtocolsTesteSwift. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: BaseViewController, PlaceholderActionDelegate, ProjectsProviderCallback {

    @IBOutlet weak private var tableView:UITableView!
    @IBOutlet weak private var header:Header!


    private var data:Array<String>;
    private var tableManager:BaseTableViewManager?
    
    override init(){
        data = Array<String>()
        super.init();
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        requestData()
    }
    
    func requestData() {
        view.startLoading()
        ProjectsProvider.getProjects(self)
    }
    
    func setupTableView(){
        data = []
        tableManager = TesteTableViewManager(tableView: tableView)
        tableManager!.updateWithData(data);
    }
    
    override func didClickPlaceholderAction(placeholder:Placeholder) {
        super.didClickPlaceholderAction(placeholder)
    }
    
    //MARK: ProjectsProviderCallback
    func didReceiveProjects(timesheetOptions:TimesheetOptions) {
        view.stopLoading()
        tableManager!.updateWithData(timesheetOptions.projects!)
    }

    

    
}
