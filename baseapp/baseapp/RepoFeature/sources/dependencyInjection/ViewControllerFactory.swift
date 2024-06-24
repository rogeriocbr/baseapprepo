//
//  ViewControllerFactory.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import UIKit

final class ViewControllerFactory{
    private let viewModelFactory :ViewModelFactory
    
    init(viewModelFactory:ViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
    
    
    func makeRepoListViewController(delegate:RepoListFlowControllerDelegate)-> RepoListViewController{
       
        return RepoListViewController.init(contentView: RepoListView(), viewModel: self.viewModelFactory.makeRepoListViewModel(),delegate: delegate)
    }
    
    func makePullRequestViewController(delegate:PullRequestFlowControllerDelegate, repo: RepositoryItem)-> PullRequestListViewController{
       
        return PullRequestListViewController.init(contentView: PullRequestListView(), viewModel: self.viewModelFactory.makePullRequestListViewModel(repo: repo), delegate: delegate)
    }
    
    func makePullRequestDetailViewController(pullRequest: PullRequestItem)-> PullRequestDetailViewController{
       
        return PullRequestDetailViewController.init(contentView: PullRequestDetailView(), viewModel: self.viewModelFactory.makePullRequestDetailViewModel(pullRequest: pullRequest))
    }
}
