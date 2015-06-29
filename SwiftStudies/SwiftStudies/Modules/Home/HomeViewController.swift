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
    
    var pendingRequest:DataRequestModel?
    
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
        requestData()
    }
    
    func requestData() {
        ProjectsProvider.getProjects(self)
    }
    
    func setupTableView(){
        data = ["Teste", "T"]
        tableManager = TesteTableViewManager(tableView: tableView)
        tableManager!.updateWithData(data);
    }
    
    func didClickPlaceholderAction(placeholder:Placeholder) {
        
    }
    
    func alert(message:String) {
        let alertController = UIAlertController(title: "Title", message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: {
            (action) in
            
            if(self.pendingRequest != nil){
                println("Oi ")
                self.pendingRequest!.repeat()
                self.pendingRequest = nil
            }
            
        } ))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //MARK: ProjectsProviderCallback
    func didReceiveProjects() {
        alert("Sucesso")
    }
    
    func onFailGetProjects() {
        alert("Erro")
    }
    
    func didFailConnection(model: DataRequestModel) {
        alert("No Internet")
        pendingRequest = model
    }
    

    
}
