//
//  RepoListTableViewDataSourceDelegate.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
 
protocol  RepoListTableViewDataSourceDelegate: AnyObject {
    func didSelect(data:  RepositoryItem)
    func didLoadNextPage()
}
