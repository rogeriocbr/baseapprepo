//
//  RepoListTableViewDataSourceProtocol.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import UIKit
 
protocol RepoListTableViewDataSourceProtocol: UITableViewDataSource, UITableViewDelegate {
   
    var items: [RepositoryItem] {get set}
    var delegate: RepoListTableViewDataSourceDelegate? {get set}
}
