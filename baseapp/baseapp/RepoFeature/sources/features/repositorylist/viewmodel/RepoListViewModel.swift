//
//  RepoListViewModel.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import Combine

class RepoListViewModel: RepoListViewModelProtocol {
    
    var state: CurrentValueSubject<RepoListState, Never> = CurrentValueSubject<RepoListState, Never>(.disable(nil, nil))
    var subjectGetData = PassthroughSubject<[RepositoryItem], Error>()
   
    private var currentPosition: Int = 1
    private var data: [RepositoryItem] = []
    
    private let usecase: RepositoryUsecase
    
    init(usecase:RepositoryUsecase) {
        self.usecase = usecase
    }
    
    func getData() {
        if state.value == .processing {
            return
        }
        state.value = .processing
        
        usecase.execute(query: "language:Swift", sort: "stars", page: currentPosition){ [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                currentPosition += 1
                self.data += data.items ?? []
                subjectGetData.send(self.data)
                state.value = .enable
            case .failure(let error):
                state.value = .enable
                subjectGetData.send(completion: .failure(error))
            }
        }
    }
    
    func resetData() {
        currentPosition = 1
        data = []
        subjectGetData.send([])
    }
}
