//
//  HomeViewController.swift
//  SwiftPOC
//
//  Created by Taqtile on 6/19/15.
//  Copyright (c) 2015 ProtocolsTesteSwift. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: BaseViewController, PlaceholderActionDelegate {

    @IBOutlet weak private var tableView:UITableView!
    @IBOutlet weak private var header:Header!


    private var data:Array<String>?;
    private var tableManager:BaseTableViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        addRightNavigationBarButton(image:"ic-back", action: "rightButtonTapped")
        addLeftNavigationBarButton(title:"Ok", action: "leftButtonTapped")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        requestData()
    }
    
    func rightButtonTapped() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    func leftButtonTapped() {
        navigationController?.pushViewController(ProductsViewController(), animated: true)
    }
    
    func requestData() {
        view.startLoading()
        ProjectsProvider.getProjects(self)
    }
    
    func setupTableView(){
        data = []
        tableManager = TesteTableViewManager(tableView: tableView, delegate:self)
        tableManager!.updateWithData(data!);
    }
    
    override func didClickPlaceholderAction(placeholder:Placeholder) {
        super.didClickPlaceholderAction(placeholder)
    }

    override func didSelectObject(object: AnyObject) {
        navigationController?.pushViewController(MapViewController(), animated: true)
    }
    
}

//MARK: ProjectsProviderCallback
extension HomeViewController: ProjectsProviderCallback {
    
    override func prepareToResponse() {
        super.prepareToResponse()
        view.stopLoading()
    }
    
    func didReceiveProjects(timesheetOptions:TimesheetOptions) {
        let project = timesheetOptions.projects?.first
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        timesheetOptions.projects!.append(project!)
        tableManager!.updateWithData(timesheetOptions.projects!)
    }
    
}