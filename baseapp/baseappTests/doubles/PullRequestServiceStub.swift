//
//  PullRequestServiceStub.swift
//  baseappTests
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
@testable import baseapp


class PullRequestServiceStub: PullRequestServiceProtocol {
    
    var shouldFail = false
    
    func pullRequestList(owner: String, repo: String, completion: @escaping (Result<baseapp.PullRequestResponseArray, baseapp.ApiError>) -> Void) {
        if !shouldFail {
            completion(.success(PullRequestResponseArray.Dummy()!))
        } else {
            completion(.failure(.dataNotFound))
        }
    }
    
    
    func repositoryList(query: String, sort: String, page: Int, completion: @escaping (Result<RepositoryResponse, ApiError>) -> Void) {
        if !shouldFail {
            completion(.success(RepositoryResponse.Dummy()!))
        } else {
            completion(.failure(.dataNotFound))
        }
    }
    

}
