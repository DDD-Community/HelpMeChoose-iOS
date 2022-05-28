//
//  Dictionary+JSONSerialization.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/05/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

extension Dictionary {
    func toJsonData(option: JSONSerialization.WritingOptions = []) -> Data {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: option) else {
            assertionFailure("serialization failed")
            return Data()
        }
        
        return jsonData
    }
}
