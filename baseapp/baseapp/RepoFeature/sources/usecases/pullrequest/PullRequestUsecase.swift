//
//  PullRequestUsecase.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

class PullRequestUsecase {
    private let service : PullRequestServiceProtocol
    
    init(service:PullRequestServiceProtocol) {
        self.service = service
    }

    func execute(owner: String, repo: String,  completion: @escaping (Result<PullRequestResponse,ApiError>) -> Void) {
        
        service.pullRequestList(owner: owner, repo: repo) { result in
            
            switch result {
                
            case .success(let data):
                let totalOpened = data.filter({ $0.state == "open" }).count
                let totalClosed = data.filter({ $0.state == "close" }).count
                let response = PullRequestResponse(items: data, totalOpened: totalOpened, totalClosed: totalClosed)
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
