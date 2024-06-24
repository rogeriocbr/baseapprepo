//
//  usecaseTests.swift
//  baseappTests
//
//  Created by Rogério Ramos on 24/06/2024.
//

import XCTest
@testable import baseapp

class usecaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryUsecaseSuccess() throws {
    
        let usecase = RepositoryUsecase(service: RepositoryServiceStub())
        usecase.execute(query: "", sort: "", page: 0) { result in
            switch result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testRepositoryUsecaseFail() throws {
    
        let service = RepositoryServiceStub()
        service.shouldFail = true
        
        let usecase = RepositoryUsecase(service: service)
        
        usecase.execute(query: "", sort: "", page: 0) { result in
            switch result {
            case .success(_):
                XCTAssert(false)
            case .failure(_):
                XCTAssert(true)
            }
        }
    }
    
    
    func testPullrequestsSuccess() throws {
    
        let usecase = PullRequestUsecase(service: PullRequestServiceStub())
        usecase.execute(owner: "", repo: "") { result in
            switch result {
            case .success(_):
                XCTAssert(true)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testPullrequestsFail() throws {
    
        let service = PullRequestServiceStub()
        service.shouldFail = true
        
        let usecase = PullRequestUsecase(service: service)
        
        usecase.execute(owner: "", repo: "") { result in
            switch result {
            case .success(_):
                XCTAssert(false)
            case .failure(_):
                XCTAssert(true)
            }
        }
    }
    


}
