//
//  Dependencies.swift
//  Config
//
//  Created by CanlabLee on 2022/06/06.
//

import ProjectDescription

//let dependencies = Dependencies(
//  carthage: [],
//  swiftPackageManager: [
//    .remote(url: "https://github.com/uber/RIBs", requirement: .upToNextMajor(from: "0.12.1")),
//  ],
//  platforms: [.iOS]
//)


let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/uber/RIBs",
            requirement: .upToNextMajor(from: "0.10.1")
        ),
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "2")
        ),
        .remote(
            url: "https://github.com/RxSwiftCommunity/RxDataSources",
            requirement: .upToNextMajor(from: "5.0.2")
        ),
        .remote(
            url: "https://github.com/ReactiveX/RxSwift",
            requirement: .upToNextMajor(from: "6.0.0")
        ),
        .remote(
            url: "https://github.com/ReactorKit/ReactorKit",
            requirement: .upToNextMajor(from: "3.1.0")
        ),
        .remote(
            url: "https://github.com/onevcat/Kingfisher",
            requirement: .upToNextMajor(from: "5.0.0")
        ),
    ],
    platforms: [.iOS]
)
