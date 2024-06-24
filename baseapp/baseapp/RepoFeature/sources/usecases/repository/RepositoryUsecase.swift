//
//  RepositoryUsecase.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

class RepositoryUsecase {
    private let service : RepositoryServiceProtocol
    
    init(service:RepositoryServiceProtocol) {
        self.service = service
    }

    func execute(query: String, sort: String, page: Int,  completion: @escaping (Result<RepositoryResponse,ApiError>) -> Void) {
        
        service.repositoryList(query: query, sort: sort, page: page) { result in
            completion(result)
        }
    }
}
