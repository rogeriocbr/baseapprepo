//
//  PullRequestDetailViewModel.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

class PullRequestDetailViewModel: PullRequestDetailViewModelProtocol {
    
    let pullRequestItem: PullRequestItem
    
    func getPullRequestURL() -> URL? {
        guard let urlStr = pullRequestItem.htmlURL, let url = URL(string: urlStr) else {
            return nil
        }
        return url
    }
    
    init(data:PullRequestItem) {
        self.pullRequestItem = data
    }
   
}
