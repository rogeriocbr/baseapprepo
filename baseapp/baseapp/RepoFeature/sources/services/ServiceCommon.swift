//
//  ServiceCommon.swift
//  baseapp
//
//  Created by Rogério Ramos on 20/06/2024.
//

import Foundation

 enum ApiError: Error {
      case networkError(Error)
      case dataNotFound
      case jsonParsingError(Error)
      case invalidStatusCode(Int)
  }
