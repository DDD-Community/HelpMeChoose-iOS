//
//  HttpConnectTarget.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/05/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation

public enum HttpError: Error {
    case undefined(Error)
    case failureStatusCode(Int)
    case emptyData
}

public protocol HttpConnectTarget {
    var baseURL: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var parameters: HttpParameter { get }
}
