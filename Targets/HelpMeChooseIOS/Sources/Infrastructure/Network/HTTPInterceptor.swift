//
//  HTTPInterceptor.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/05.
//  Copyright © 2022 JYKang. All rights reserved.
//

public protocol HTTPInterceptor {
    func willSendRequest()
    func didSendRequest()
    func didReceiveResponse()
}

extension HTTPInterceptor {
    public func willSendRequest() {}
    public func didSendRequest() {}
    public func didReceiveResponse() {}
}
