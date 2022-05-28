//
//  TodosAPI.swift
//  HelpMeChooseIOS
//
//  Created by 이치원 on 2022/05/28.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

public enum TodosAPI {
}

extension TodosAPI: HttpConnectTarget {
    public var path: String
    
    public var method: HttpMethod
    
    public var parameters: HttpParameter
}
