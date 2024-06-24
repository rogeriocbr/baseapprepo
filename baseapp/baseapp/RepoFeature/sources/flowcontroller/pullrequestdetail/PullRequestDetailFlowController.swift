//
//  PullRequestDetailFlowController.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit

class PullRequestDetailFlowController :BaseFlowController{
    
    func start(data:PullRequestItem){
        let viewController = viewcontrollerFactory.makePullRequestDetailViewController(pullRequest: data)
            present(viewController: viewController)
    }
    
}
