//
//  PullRequestListTableViewDataSourceProtocol.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import UIKit
 
protocol PullRequestListTableViewDataSourceProtocol: UITableViewDataSource, UITableViewDelegate {
   
    var items: [PullRequestItem] {get set}
    var delegate: PullRequestListTableViewDataSourceDelegate? {get set}
}
