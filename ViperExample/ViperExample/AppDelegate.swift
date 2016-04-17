//
//  AppDelegate.swift
//  ViperExample
//
//  Created by eduardo.ferreira on 4/16/16.
//  Copyright © 2016 eduardoeof. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        initWindow()
        
        if let window = window {
            MainWireframe.addMainOnWindow(window)
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: Private
    
    private func initWindow() {
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
    }
    
}

