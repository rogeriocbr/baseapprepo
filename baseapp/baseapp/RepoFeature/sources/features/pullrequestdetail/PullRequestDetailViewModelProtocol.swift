//
//  PullRequestDetailViewModelProtocol.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

protocol PullRequestDetailViewModelProtocol {
    var pullRequestItem: PullRequestItem { get }
    func getPullRequestURL() -> URL?
}

