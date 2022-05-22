//
//  HTTPConnectTarget.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/05/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

public enum HTTPError: Error {
    case undefined(Error)
    case failureStatusCode(Int)
    case emptyData
}

public protocol HTTPConnectTarget {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: HTTPParameter { get }
}
