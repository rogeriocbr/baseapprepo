//
//  viewmodelsTests.swift
//  baseappTests
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Combine
import XCTest
@testable import baseapp

class viewmodelsTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
            super.setUp()
            cancellables = []
        }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepoListViewModelSuccessGetData() throws {
    
        let usecase = RepositoryUsecase(service: RepositoryServiceStub())
        let viewModel = RepoListViewModel(usecase: usecase)
        var repositories: [RepositoryItem] = []
        var error: Error?
        let expectation = self.expectation(description: "RepoListViewModelSuccess")
        
        viewModel.subjectGetData.sink(receiveCompletion: { result in
           
            switch result {
            case .finished:
                break
            case .failure(let encounteredError):
                error = encounteredError
            }
            expectation.fulfill()
        }, receiveValue: { data in
            repositories = data
            expectation.fulfill()
        }) .store(in: &cancellables)
        
        viewModel.getData()
        waitForExpectations(timeout: 10)
        
        XCTAssertNil(error)
        XCTAssert(repositories.count > 0)
    }

    func testRepoListViewModelFailGetData() throws {
    
        let service = RepositoryServiceStub()
        service.shouldFail = true
        let usecase = RepositoryUsecase(service: service)
        let viewModel = RepoListViewModel(usecase: usecase)
        var repositories: [RepositoryItem] = []
        var error: Error?
        let expectation = self.expectation(description: "RepoListViewModelFail")
        
        viewModel.subjectGetData.sink(receiveCompletion: { result in
           
            switch result {
            case .finished:
                break
            case .failure(let encounteredError):
                error = encounteredError
            }
            expectation.fulfill()
        }, receiveValue: { data in
            repositories = data
            expectation.fulfill()
        }) .store(in: &cancellables)
        
        viewModel.getData()
        waitForExpectations(timeout: 10)
        
        XCTAssertNotNil(error)
        XCTAssert(repositories.count == 0)
    
    }
    
    func testPullRequestListViewModelSuccessGetData() throws {
    
        let usecase = PullRequestUsecase(service: PullRequestServiceStub())
        let selectedRepo = RepositoryResponse.Dummy()?.items?.first
        let viewModel = PullRequestListViewModel(usecase: usecase, repo: selectedRepo!)
        var prs: PullRequestResponse = .init()
        var error: Error?
        let expectation = self.expectation(description: "PullRequestListViewModelSuccess")
        
        viewModel.subjectGetData.sink(receiveCompletion: { result in
           
            switch result {
            case .finished:
                break
            case .failure(let encounteredError):
                error = encounteredError
            }
            expectation.fulfill()
        }, receiveValue: { data in
            prs = data
            expectation.fulfill()
        }) .store(in: &cancellables)
        
        viewModel.getData()
        waitForExpectations(timeout: 10)
        
        XCTAssertNil(error)
        XCTAssert(prs.items.count > 0)
    }
    
    func testPullRequestListViewModelFailGetData() throws {
    
        let service = PullRequestServiceStub()
        service.shouldFail = true
        let usecase = PullRequestUsecase(service: service)
        let selectedRepo = RepositoryResponse.Dummy()?.items?.first
        let viewModel = PullRequestListViewModel(usecase: usecase, repo: selectedRepo!)
        var prs: PullRequestResponse = .init()
        var error: Error?
        let expectation = self.expectation(description: "PullRequestListViewModelFail")
        
        viewModel.subjectGetData.sink(receiveCompletion: { result in
           
            switch result {
            case .finished:
                break
            case .failure(let encounteredError):
                error = encounteredError
            }
            expectation.fulfill()
        }, receiveValue: { data in
            prs = data
            expectation.fulfill()
        }) .store(in: &cancellables)
        
        viewModel.getData()
        waitForExpectations(timeout: 10)
        
        XCTAssertNotNil(error)
        XCTAssert(prs.items.count == 0)
        
    }
}
