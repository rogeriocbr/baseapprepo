//
//  PullRequestListTableViewDataSource.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//


import UIKit
  
 final class PullRequestListTableViewDataSource: NSObject,  PullRequestListTableViewDataSourceProtocol {
  
    
     var items: [PullRequestItem] = []
     weak var delegate: PullRequestListTableViewDataSourceDelegate?
  
     func updateItems(_ items: [PullRequestItem]) {
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
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PullRequestViewCell.self)
         
        cell.selectionStyle = .none
        cell.setData(data: items[indexPath.row])
         return cell
     }
  
     
    
  
    
 }
