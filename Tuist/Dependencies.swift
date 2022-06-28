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
            url: "https://github.com/DevYeom/ModernRIBs.git",
            requirement: .upToNextMajor(from: "1.0.2")
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
            url: "https://github.com/CombineCommunity/CombineCocoa.git",
            requirement: .upToNextMajor(from: "0.2.1")
        )
    ],
    platforms: [.iOS]
)
