//
//  RootBuilder.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs
import UIKit.UIWindow

protocol RootDependency: Dependency {}

final class RootComponent: Component<RootDependency>, SplashDependency {
    
    let rootViewController: RootViewController
    
    init(
        dependency: RootDependency,
        rootViewController: RootViewController
    ) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build(window: UIWindow) -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }
    
    func build(window: UIWindow) -> LaunchRouting {
        let viewController = RootViewController()
        let component = RootComponent(dependency: dependency,
                                      rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController)
        let splashBuilder = SplashBuilder(dependency: component)
        let router = RootRouter(
            window: window,
            interactor: interactor,
            viewController: viewController,
            splashBuilder: splashBuilder
        )

        return router
    }
}
