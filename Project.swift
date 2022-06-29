import ProjectDescription
import ProjectDescriptionHelpers



let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UILaunchStoryboardName": "LaunchScreen",
    "NSAppTransportSecurity" : ["NSAllowsArbitraryLoads":true],
    "UISupportedInterfaceOrientations" : ["UIInterfaceOrientationPortrait"],
    "UIUserInterfaceStyle":"Light",
    "UIApplicationSceneManifest" : ["UIApplicationSupportsMultipleScenes":true,
                                    "UISceneConfigurations":[
                                        "UIWindowSceneSessionRoleApplication":[[
                                            "UISceneConfigurationName":"Default Configuration",
                                            "UISceneDelegateClassName":"$(PRODUCT_MODULE_NAME).SceneDelegate"
                                        ]]
                                    ]
                                   ]
]

let project = Project(
    name: "HelpMeChooseIOS",
    organizationName: "JYKang",
    settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release")
    ]),
    targets: [
        Target(
            name: "HelpMeChooseIOS",
            platform: .iOS,
            product: .app,
            bundleId: "io.tuist.HelpMeChooseIOS",
            deploymentTarget : .iOS(targetVersion: "13.0.0", devices: .iphone),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/HelpMeChooseIOS/Sources/**"],
            resources: ["Targets/HelpMeChooseIOS/Resources/**"],
            dependencies: [
                .external(name: "RIBs"),
                .external(name: "SnapKit"),
                .external(name: "Then"),
                .external(name: "RxDataSources"),
                .external(name: "RxSwift"),
                .external(name: "RxCocoa"),
                .external(name: "ReactorKit"),
                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "HelpMeChooseIOSTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.HelpMeChooseIOSTests",
            deploymentTarget : .iOS(targetVersion: "13.0.0", devices: .iphone),
            infoPlist: .default,
            sources: ["Targets/HelpMeChooseIOS/Tests/**"],
            dependencies: [
            ]
        )
    ]
    
)
