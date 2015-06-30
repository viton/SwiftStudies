//
//  AppDelegate.swift
//  SwiftPOC
//
//  Created by Taqtile on 6/19/15.
//  Copyright (c) 2015 ProtocolsTesteSwift. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabbarController: AppTabBarViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds);
        tabbarController = AppTabBarViewController()
        let home = HomeViewController()
        window!.rootViewController = tabbarController
        window!.makeKeyAndVisible();
        window!.backgroundColor = UIColor.whiteColor();
        
        return true
    }

}

