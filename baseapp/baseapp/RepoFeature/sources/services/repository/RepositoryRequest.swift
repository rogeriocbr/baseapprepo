//
//  RepositoryRequest.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

enum RepositoryRequest: Request {
    var path: String {
        return "https://api.github.com/search/repositories"
    }
    
    var headers: [String : Any]? {
        //var additionalHeaders: [String:String] = [:]
        //additionalHeaders.updateValue("", forKey: "")
        return [:]//additionalHeaders
    }
    var queryParameters: [String: Any] {
        switch self {
        case .list(let query, let sort, let page):
            var queryParameters: [String: Any] = [:]
            queryParameters.updateValue(query, forKey: "q")
            queryParameters.updateValue(sort, forKey: "sort")
            queryParameters.updateValue(page, forKey: "page")
            return queryParameters
        }
    }
    case list(query:String, sort:String, page: Int)
    
    var method: HTTPMethod {
        return .get
    }
    
}
