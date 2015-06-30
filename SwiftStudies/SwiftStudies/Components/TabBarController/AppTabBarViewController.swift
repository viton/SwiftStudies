//
//  AppTabBarViewController.swift
//  SwiftStudies
//
//  Created by Taqtile on 6/30/15.
//  Copyright (c) 2015 viton. All rights reserved.
//

import UIKit

class AppTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
        tabBar.translucent = false
    }

    func setupViewControllers() {
        var controllers = Array<UIViewController>()
        for var i=0; i<5; i++ {
            let viewController = HomeViewController()
            controllers.append(viewController)
            addTabbarItem(viewController, title: "Home", imageName: "ic-home", tag: i)
        }
        setViewControllers(controllers, animated: false)
    }
    
    func addTabbarItem(controller:UIViewController, title:String, imageName:String, tag:Int) {
        var image = UIImage(named: imageName)
        controller.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
    }
    
}
