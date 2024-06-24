//
//  ServiceFactory.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

final class ServiceFactory {
    
    func makeRepositoryService() -> RepositoryServiceProtocol {
        return RepositoryService()
    }
    func makePullRequestService() -> PullRequestServiceProtocol {
        return PullRequestService()
    }
}
