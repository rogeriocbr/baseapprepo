//
//  RepoListViewModelProtocol.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//


import Foundation
import Combine

enum RepoListState: Equatable {
    case disable (String?, String?)
    case processing
    case enable
}

protocol RepoListViewModelProtocol {

    var state: CurrentValueSubject<RepoListState, Never> { get set}
    var subjectGetData: PassthroughSubject<[RepositoryItem], Error> {get set}
    func getData()
    func resetData()
}

