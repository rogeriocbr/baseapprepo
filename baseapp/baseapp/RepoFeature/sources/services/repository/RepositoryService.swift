//
//  RepositoryService.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//

import Foundation


class RepositoryService: RepositoryServiceProtocol {
    
    
    func repositoryList(query: String, sort: String, page: Int, completion: @escaping (Result<RepositoryResponse, ApiError>) -> Void) {
        let request = RepositoryRequest.list(query: query, sort: sort, page: page)
        
        guard var urlComponents = URLComponents(string: request.path) else { return  }
        var urlQueryItems = [URLQueryItem]()

        let queryParameters = request.queryParameters
        queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
        guard let url = urlComponents.url else { return }
    
        let session = URLSession.shared

        
        let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)

           
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
           
                    guard error == nil else {
                        DispatchQueue.main.async {
                            completion(.failure(ApiError.networkError(error!)))
                        }
                        return
                    }

                    guard let data = data else {
                        DispatchQueue.main.async {
                            completion(.failure(ApiError.dataNotFound))
                        }
                        return
                    }
            
                    do {
                        
                        let decodedObject = try JSONDecoder().decode(RepositoryResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            completion(Result.success(decodedObject))
                        }
                    } catch let error {
                        DispatchQueue.main.async {
                            print(error)
                            if let error = (error as? DecodingError) {
                                completion(.failure(ApiError.jsonParsingError(error)))
                            } else {
                                completion(.failure(ApiError.networkError(error)))
                            }
                        }
                    }
                }
            )

            task.resume()

        
    }
    

}
