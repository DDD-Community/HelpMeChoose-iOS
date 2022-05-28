//
//  Any+Casting.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/05/22.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

extension Data {
    public func toJsonDictionary(option: JSONSerialization.ReadingOptions = []) -> [String: Any] {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: option) else {
            assertionFailure("deserialization failed")
            return [:]
        }
        guard let jsonDictionary = jsonObject as? [String: Any] else {
            assertionFailure("this object is not in dictionary form")
            return [:]
        }
        
        return jsonDictionary
    }
}
