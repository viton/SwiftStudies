//
//  HomeViewController.swift
//  SwiftPOC
//
//  Created by Taqtile on 6/19/15.
//  Copyright (c) 2015 ProtocolsTesteSwift. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, PlaceholderActionDelegate {

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
    
    
    func setupTableView(){
        data = ["Teste", "T"]
        tableManager = TesteTableViewManager(tableView: tableView)
        tableManager!.updateWithData(data);
    }
    
    func didClickPlaceholderAction(placeholder:Placeholder) {
        
    }
    
}
