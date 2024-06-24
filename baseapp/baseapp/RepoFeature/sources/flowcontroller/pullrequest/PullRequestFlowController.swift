//
//  PullRequestFlowController.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit

class PullRequestFlowController :BaseFlowController{
    
    func start(flowDelegate:PullRequestFlowControllerDelegate, data:RepositoryItem){
        let viewController = viewcontrollerFactory.makePullRequestViewController(delegate: flowDelegate, repo: data)
        push(viewController: viewController)
    }
    
}
