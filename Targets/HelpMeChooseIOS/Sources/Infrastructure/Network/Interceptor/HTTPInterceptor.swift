//
//  HTTPInterceptor.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/05.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation.NSURLRequest
import Foundation.NSURLResponse

public protocol HTTPInterceptor {
    func resetRequest(
        request: URLRequest,
        target: HTTPConnectTarget
    ) -> URLRequest
    func willSendRequest()
    func didSendRequest()
    func didReceiveResponse(
        result: (Result<Data, HTTPError>, URLResponse),
        target: HTTPConnectTarget
    ) -> Result<Data, HTTPError>
}

extension HTTPInterceptor {
    public func resetRequest(
        request: URLRequest,
        target: HTTPConnectTarget
    ) -> URLRequest { return request }
    public func willSendRequest() {}
    public func didSendRequest() {}
    public func didReceiveResponse(
        result: (Result<Data, HTTPError>, URLResponse),
        target: HTTPConnectTarget
    ) -> Result<Data, HTTPError> { return result.0 }
}

