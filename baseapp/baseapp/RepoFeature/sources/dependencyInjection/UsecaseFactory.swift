//
//  UsecaseFactory.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

final class UsecaseFactory {
    private  let serviceFactory: ServiceFactory
    
    init(serviceFactory:ServiceFactory) {
        self.serviceFactory = serviceFactory
    }
    
    func makeRepositoryUsecase() -> RepositoryUsecase {
        return RepositoryUsecase(service: self.serviceFactory.makeRepositoryService())
    }
    
    func makePullRequestUsecase() -> PullRequestUsecase {
        return PullRequestUsecase(service: self.serviceFactory.makePullRequestService())
    }
}
