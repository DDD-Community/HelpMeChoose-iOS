//
//  HTTPParameter.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/05/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation


public protocol HTTPParameter {
    var queryDict: [String: Any]? { get }
    var queryString: String { get }
    
    // 데이터 전송 형태는 제이슨을 기본으로 한다는 가정하에 만듦
    var body: [String: Any]? { get }
}

extension HTTPParameter {
    var queryString: String {
        var result = ""
        
        guard let queryDict = queryDict else { return result }
        
        for (key, value) in queryDict {
            let valueString = "\(value)"
            let query: String
            if valueString.isArray {
                query = valueString
                    .dropFirst()
                    .dropLast()
                    .components(separatedBy: ",")
                    .reduce("") { $0 + toQuery(key: key, value: $1) }
            } else {
                query = toQuery(key: key, value: valueString)
            }
            
            result += query
        }
        
        return result
    }
    
    private func toQuery(key: String, value: Any) -> String {
        return "?\(key)=\(String(describing: value))"
    }
}

