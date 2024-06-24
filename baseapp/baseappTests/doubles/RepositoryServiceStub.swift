//
//  RepositoryServiceStub.swift
//  baseappTests
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
@testable import baseapp


class RepositoryServiceStub: RepositoryServiceProtocol {
    
    var shouldFail = false
    
    func repositoryList(query: String, sort: String, page: Int, completion: @escaping (Result<RepositoryResponse, ApiError>) -> Void) {
        if !shouldFail {
            completion(.success(RepositoryResponse.Dummy()!))
        } else {
            completion(.failure(.dataNotFound))
        }
    }
    

}
