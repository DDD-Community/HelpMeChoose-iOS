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
            requirement: .upToNextMajor(from: "1.0.0")
        )
    ],
    platforms: [.iOS]
)
