//
//  PullRequestServiceProtocol.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation


protocol PullRequestServiceProtocol {
    func pullRequestList(owner: String, repo: String, completion: @escaping (Result<PullRequestResponseArray,ApiError>) -> Void)
}
