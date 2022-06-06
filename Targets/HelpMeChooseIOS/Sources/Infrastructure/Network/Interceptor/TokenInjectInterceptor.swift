//
//  TokenInjectInterceptor.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/05.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

public enum AcessToken {
    case bearer(String)
    case custom(String)
    
    public var value: String {
        switch self {
        case let .bearer(value): return "Bearer \(value)"
        case let .custom(value): return value
        }
    }
}

public class TokenInjectInterceptor: HTTPInterceptor {
    private let headerFieldKey = "Authorization"
    let token: () -> AcessToken
    
    public init(token: @escaping () -> AcessToken) {
        self.token = token
    }
    public func resetRequest(
        request: URLRequest,
        target: HTTPConnectTarget
    ) -> URLRequest {
        let token = token()
        var newRequest = request
        
        if token.value == request.value(forHTTPHeaderField: headerFieldKey){ return request }
        
        newRequest.setValue(token.value, forHTTPHeaderField: headerFieldKey)
        
        return newRequest
    }
}
