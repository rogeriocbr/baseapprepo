//
//  PullRequestListViewModelProtocol.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation
import Combine

enum PullRequestListState: Equatable {
    case disable (String?, String?)
    case processing
    case enable
}

protocol PullRequestListViewModelProtocol {
    
    var state: CurrentValueSubject<PullRequestListState, Never> { get set}
   
    var subjectGetData: PassthroughSubject<PullRequestResponse, Error> {get set}
    
    func getData()
}

