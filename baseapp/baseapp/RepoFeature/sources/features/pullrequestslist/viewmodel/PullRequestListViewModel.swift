//
//  PullRequestListViewModel.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import Combine

class PullRequestListViewModel: PullRequestListViewModelProtocol {
    
    var state: CurrentValueSubject<PullRequestListState, Never> = CurrentValueSubject<PullRequestListState, Never>(.disable(nil, nil))
    var subjectGetData = PassthroughSubject<PullRequestResponse, Error>()
    
    let selectedRepository: RepositoryItem
   
    private let usecase: PullRequestUsecase
    
    init(usecase:PullRequestUsecase, repo: RepositoryItem) {
        self.usecase = usecase
        self.selectedRepository = repo
    }
    
    func getData() {
        if state.value == .processing {
            return
        }
        state.value = .processing
        
        usecase.execute(owner: selectedRepository.owner?.login ?? "", repo: selectedRepository.name ?? ""){ [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                subjectGetData.send(data)
                state.value = .enable
            case .failure(let error):
                state.value = .enable
                subjectGetData.send(completion: .failure(error))
            }
        }
    }
}
