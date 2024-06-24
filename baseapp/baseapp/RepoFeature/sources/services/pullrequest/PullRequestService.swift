//
//  PullRequestService.swift
//  baseapp
//
//  Created by Rogério Ramos on 24/06/2024.
//


import Foundation


class PullRequestService: PullRequestServiceProtocol {
    
    func pullRequestList(owner: String, repo: String, completion: @escaping (Result<PullRequestResponseArray,ApiError>) -> Void){
        let request = PullreqRequest.list(owner: owner, repo: repo)
        
        guard let urlComponents = URLComponents(string: request.path) else { return  }
        
        guard let url = urlComponents.url else { return }
    
        let session = URLSession.shared

        
        let urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)

           
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
                        
                        let decodedObject = try JSONDecoder().decode(PullRequestResponseArray.self, from: data)
                        
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
