//
//  PullRequestFlowControllerDelegate.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

protocol PullRequestFlowControllerDelegate: AnyObject {
    func gotoDetail(pullRequest: PullRequestItem)
}
