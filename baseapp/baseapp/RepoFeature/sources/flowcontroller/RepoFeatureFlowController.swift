//
//  RepoFeatureFlowController.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import UIKit

public class RepoFeatureFlowController {
    public let navigationViewController: UINavigationController
    private var viewcontrollerFactory: ViewControllerFactory!
    private var currentFlowController: BaseFlowController!
    public init(  navigationViewController: UINavigationController) {
        self.navigationViewController =  navigationViewController
        assembleDependencies()
    }
    private func assembleDependencies(){
        let serviceFactory = ServiceFactory.init()
        let usecaseFactory = UsecaseFactory.init(serviceFactory: serviceFactory)
        let viewmodelFactory = ViewModelFactory.init(usecaseFactory: usecaseFactory)
        viewcontrollerFactory = ViewControllerFactory.init(viewModelFactory: viewmodelFactory)
    }
    
    
    public func start() {
    
        currentFlowController = FlowStarter.repoListFlowController(navigationController: self.navigationViewController, viewcontrollerFactory: self.viewcontrollerFactory,flowDelegate: self)
        
    }
    
}


extension RepoFeatureFlowController: RepoListFlowControllerDelegate {
   func flowToDetailView(_ data:RepositoryItem){
       
       currentFlowController = FlowStarter.pullRequestListFlowController(navigationController: self.navigationViewController, viewcontrollerFactory: self.viewcontrollerFactory, flowDelegate: self, data: data)
    }
}

extension RepoFeatureFlowController: PullRequestFlowControllerDelegate {
    func gotoDetail(pullRequest: PullRequestItem) {
        
        currentFlowController = FlowStarter.pullRequestDetailFlowController(navigationController: navigationViewController, viewcontrollerFactory: self.viewcontrollerFactory, data: pullRequest)
    }
    
}
