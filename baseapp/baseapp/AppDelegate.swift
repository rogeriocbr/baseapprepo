//
//  AppDelegate.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    private var rootNavigationController: UINavigationController!
    var flowRepoFeature:RepoFeatureFlowController!
    var window:UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        rootNavigationController = UINavigationController()
        presentRepositories(navigationController: rootNavigationController!)
        self.window = UIWindow(frame: UIScreen.main.bounds)
         window?.rootViewController = rootNavigationController
         window?.backgroundColor = .white
         window?.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        return true
    }



}

