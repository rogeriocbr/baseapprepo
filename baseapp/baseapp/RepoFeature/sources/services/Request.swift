//
//  Request.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation

public enum HTTPMethod: String {
    case get
    case put
    case post
    case patch
    case delete
    
    var name: String {
        return self.rawValue.uppercased()
    }
}

public protocol Request {
    
    var path: String {get}
    var method : HTTPMethod {get}
    var headers: [String: Any]? {get}
    
}
