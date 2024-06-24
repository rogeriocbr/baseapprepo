//
//  PullreqRequest.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

enum PullreqRequest: Request {
    
    var path: String {
        switch self {
        case .list(let owner, let repo):
            return "https://api.github.com/repos/\(owner)/\(repo)/pulls"
        }
    }
    
    var queryParameters: [String: Any] {
        switch self {
        case .list(_, _):
            let queryParameters: [String: Any] = [:]
            return queryParameters
        }
    }
    var headers: [String : Any]? {
        //var additionalHeaders: [String:String] = [:]
        //additionalHeaders.updateValue("", forKey: "")
        return [:]//additionalHeaders
    }
   
    case list(owner:String, repo:String)
    
    var method: HTTPMethod {
        return .get
    }
    
}
