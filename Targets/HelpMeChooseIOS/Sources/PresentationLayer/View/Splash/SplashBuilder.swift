//
//  SplashBuilder.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import RIBs

protocol SplashDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SplashComponent: Component<SplashDependency> {

}

// MARK: - Builder

protocol SplashBuildable: Buildable {
    func build(withListener listener: SplashListener) -> SplashRouting
}

final class SplashBuilder: Builder<SplashDependency>, SplashBuildable {

    override init(dependency: SplashDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SplashListener) -> SplashRouting {
        let component = SplashComponent(dependency: dependency)
        let viewController = SplashViewController()
        let interactor = SplashInteractor(presenter: viewController)
        interactor.listener = listener
        let loginBuilder = LoginBuilder(dependency: component)
        let signUpBuildeer = SignUpBuilder(dependency: component)
        return SplashRouter(loginBuilder: loginBuilder, signUpBuilder: signUpBuildeer, interactor: interactor, viewController: viewController)
    }
    
}
