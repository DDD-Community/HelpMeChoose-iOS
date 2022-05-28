//
//  API.swift
//  HelpMeChooseIOS
//
//  Created by 이치원 on 2022/05/28.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

protocol API: HttpConnectTarget {
    
}

extension API {
    var baseURL: String { "https://jsonplaceholder.typicode.com" }
}
