//
//  RepoListFlowController.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit

class RepoListFlowController :BaseFlowController{
    
    func start(flowDelegate:RepoListFlowControllerDelegate){
        let viewController = viewcontrollerFactory.makeRepoListViewController(delegate: flowDelegate)
        push(viewController: viewController)
    }
    
    func detail(flowDelegate:PullRequestFlowControllerDelegate, data: RepositoryItem){
        let viewController = viewcontrollerFactory.makePullRequestViewController( delegate: flowDelegate, repo:data)
        push(viewController: viewController)
    }
}
