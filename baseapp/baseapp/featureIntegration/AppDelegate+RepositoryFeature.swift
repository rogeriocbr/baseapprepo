//
//  AppDelegate+RepositoryFeature.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import UIKit



extension AppDelegate {
    
    internal func presentRepositories(navigationController:UINavigationController){
        
        self.flowRepoFeature = RepoFeatureFlowController.init(navigationViewController:navigationController)
        flowRepoFeature.start()
    }
}
