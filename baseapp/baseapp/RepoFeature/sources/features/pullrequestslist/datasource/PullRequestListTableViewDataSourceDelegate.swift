//
//  PullRequestListTableViewDataSourceDelegate.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
 
protocol  PullRequestListTableViewDataSourceDelegate: AnyObject {
    func didSelect(data:  PullRequestItem)
}
