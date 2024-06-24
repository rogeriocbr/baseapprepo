//
//  RepositoryServiceProtocol.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation


protocol RepositoryServiceProtocol {
    func repositoryList(query: String, sort: String, page: Int, completion: @escaping (Result<RepositoryResponse,ApiError>) -> Void)
}
