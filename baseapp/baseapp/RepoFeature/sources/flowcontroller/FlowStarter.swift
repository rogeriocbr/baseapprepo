//
//  FlowStarter.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import UIKit

class FlowStarter {
    
    static func repoListFlowController(navigationController:UINavigationController,  viewcontrollerFactory: ViewControllerFactory!, flowDelegate:RepoListFlowControllerDelegate)->RepoListFlowController{
        
        let flowController = RepoListFlowController(navigationController: navigationController, viewcontrollerFactory:viewcontrollerFactory)
        flowController.start(flowDelegate:flowDelegate)
        return flowController
    }
    
    static func pullRequestListFlowController(navigationController:UINavigationController,  viewcontrollerFactory: ViewControllerFactory!, flowDelegate:PullRequestFlowControllerDelegate,
                                        data: RepositoryItem )->PullRequestFlowController{
        
        let flowController = PullRequestFlowController(navigationController: navigationController, viewcontrollerFactory:viewcontrollerFactory)
        flowController.start(flowDelegate:flowDelegate, data: data)
        return flowController
    }
    
    static func pullRequestDetailFlowController(navigationController:UINavigationController,  viewcontrollerFactory: ViewControllerFactory!,
          data: PullRequestItem )->PullRequestDetailFlowController{
        
        let flowController = PullRequestDetailFlowController(navigationController: navigationController, viewcontrollerFactory:viewcontrollerFactory)
        flowController.start(data: data)
        return flowController
    }
    
}
