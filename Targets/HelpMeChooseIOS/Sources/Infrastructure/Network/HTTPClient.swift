//
//  HTTPClient.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/05/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

public class HTTPClient {
    public func jsonRequest(
    target: HTTPConnectTarget,
    timeoutInterval: TimeInterval = 0,
    completionHandler: @escaping (Result<[String: Any], HTTPError>) -> Void
    ) {
        request(target: target) { result in
            switch result {
            case let .success(value):
                completionHandler(.success(value.toJsonDictionary()))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    public func request(
    target: HTTPConnectTarget,
    timeoutInterval: TimeInterval = 0,
    completionHandler: @escaping (Result<Data, HTTPError>) -> Void
   ) {
       
       let url = URL(string:
                        target.baseURL +
                        target.path +
                        target.parameters.queryString
       )
       
       guard let url = url else {
           assertionFailure("Invalid url")
           return
       }
       
       var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)
       request.httpBody = target.parameters.body?.toJsonData()
       
       
       URLSession.shared.dataTask(
        with: request) { data, response, error in
            if let error = error {
                completionHandler(.failure(.undefined(error)))
                return
            }
            if let response = response as? HTTPURLResponse,
               !(200...299).contains(response.statusCode) {
                completionHandler(.failure(.failureStatusCode(response.statusCode)))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.emptyData))
                return
            }

            completionHandler(.success(data))
        }
    }
    
}
