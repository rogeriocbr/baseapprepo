//
//  PullRequestResponseArrayDummy.swift
//  baseappTests
//
//  Created by Rogério Ramos on 24/06/2024.
//

import XCTest
@testable import baseapp

extension PullRequestResponseArray {
    
    static func Dummy() -> PullRequestResponseArray? {
        let file = Bundle(for: usecaseTests.self).url(forResource: "PullRequestResponseTest", withExtension: "json")
        if let file {
               do {
                   let data = try Data(contentsOf: file)
                   let decoder = JSONDecoder()
                   let jsonData = try decoder.decode(PullRequestResponseArray.self, from: data)
                   return jsonData
               } catch {
                   print("error:\(error)")
               }
           }
           return nil
    }
}
