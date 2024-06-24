//
//  BaseFlowController.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//


import Foundation
import UIKit

class BaseFlowController {
    internal var navigationController:UINavigationController
    internal var viewcontrollerFactory: ViewControllerFactory
    init(navigationController:UINavigationController,  viewcontrollerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewcontrollerFactory = viewcontrollerFactory
    }
    func push(viewController:UIViewController){
       
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func present(viewController:UIViewController){
       
        self.navigationController.present(viewController, animated: true)
    }
}
