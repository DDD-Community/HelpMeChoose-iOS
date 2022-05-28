//
//  String+IsArray.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/05/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

extension String {
    var isArray: Bool {
        return self.first == "[" &&
        self.last == "]"
    }
}
