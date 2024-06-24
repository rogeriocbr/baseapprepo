//
//  ViewModelFactory.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation


final class ViewModelFactory {
    
    private let usecaseFactory : UsecaseFactory
    
    init(usecaseFactory:UsecaseFactory) {
        self.usecaseFactory = usecaseFactory
    }
   
    
    func makeRepoListViewModel() -> RepoListViewModelProtocol {
        return RepoListViewModel.init(usecase: usecaseFactory.makeRepositoryUsecase())
    }
    
    func makePullRequestListViewModel(repo: RepositoryItem) -> PullRequestListViewModelProtocol {
        return PullRequestListViewModel.init(usecase: usecaseFactory.makePullRequestUsecase(), repo: repo)
    }
    
    func makePullRequestDetailViewModel(pullRequest: PullRequestItem) -> PullRequestDetailViewModelProtocol {
        return PullRequestDetailViewModel.init(data: pullRequest)
    }
}
