//
//  RepoListTableViewDataSource.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit
  
 final class RepoListTableViewDataSource: NSObject,  RepoListTableViewDataSourceProtocol {
  
    
     var items: [RepositoryItem] = []
     weak var delegate: RepoListTableViewDataSourceDelegate?
  
     func updateItems(_ items: [RepositoryItem]) {
         self.items = items
     }
  
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
  
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return items.count
     }
   
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.delegate?.didSelect(data: self.items[indexPath.row])
     }
  
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: RepoViewCell.self)
  
        cell.selectionStyle = .none
        cell.setData(data: items[indexPath.row])
  
         if indexPath.row == items.count - 1 {
             self.delegate?.didLoadNextPage()
         }
         return cell
     }
  
     
    
  
    
 }
