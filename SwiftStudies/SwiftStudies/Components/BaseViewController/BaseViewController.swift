//
//  BaseViewController.swift
//  SwiftPOC
//
//  Created by Taqtile on 6/19/15.
//  Copyright (c) 2015 ProtocolsTesteSwift. All rights reserved.
//

import UIKit

protocol BaseProviderCallback {
    
    func onConnectionFailToRequest(model: DataRequestModel)
    
    func onFailRequest()
    
    func prepareToResponse()
}

class BaseViewController: UIViewController, PlaceholderActionDelegate {

    var noConnectionPlaceholder:Placeholder?
    var pendingRequest:DataRequestModel?
    
    init(){
        super.init(nibName:NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last! ,bundle:nil);
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackBarButton()
        edgesForExtendedLayout = UIRectEdge.None;
    }
    
    func setupBackBarButton() {
        if let navigationController = navigationController {
            if navigationController.viewControllers.count > 1 {
                addBackBarButton()
            }
        }
    }
    
    func backButtonTapped() {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func alert(message:String) {
        let alertController = UIAlertController(title: "Title", message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: { (action) in
            if(self.pendingRequest != nil){
                println("Oi ")
                self.pendingRequest!.repeat()
                self.pendingRequest = nil
            }
        } ))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func didClickPlaceholderAction(placeholder:Placeholder) {
        if pendingRequest != nil {
            pendingRequest?.repeat()
        }
    }
    
}

extension BaseViewController: BaseProviderCallback {
    
    func onConnectionFailToRequest(model: DataRequestModel) {
        if(noConnectionPlaceholder == nil){
            noConnectionPlaceholder = Placeholder(frame: view.frame)
            view.addSubview(noConnectionPlaceholder!)
            view.addAllConstraints(noConnectionPlaceholder!)
            self.pendingRequest = model
            noConnectionPlaceholder?.delegate = self
        }
        noConnectionPlaceholder?.hidden = false
    }
    
    func onFailRequest() {
        alert("Erro")
    }
    
    func prepareToResponse() {
        view.removePlaceholder(&noConnectionPlaceholder)
    }
    
}

extension BaseViewController: BaseTableViewManagerDelegate {
    
    func didSelectObject(object: AnyObject) {
        println(object)
    }
    
}