//
//  RepoListFlowControllerDelegate.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

protocol RepoListFlowControllerDelegate: AnyObject {
    func flowToDetailView(_ data:RepositoryItem)
}
