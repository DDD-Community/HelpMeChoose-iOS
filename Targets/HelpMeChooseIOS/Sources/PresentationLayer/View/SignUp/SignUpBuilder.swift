//
//  SignUpBuilder.swift
//  HelpMeChooseIOS
//
//  Created by 강지윤 on 2022/06/26.
//  Copyright © 2022 JYKang. All rights reserved.
//

import RIBs

protocol SignUpDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SignUpComponent: Component<SignUpDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SignUpBuildable: Buildable {
    func build(withListener listener: SignUpListener) -> SignUpRouting
}

final class SignUpBuilder: Builder<SignUpDependency>, SignUpBuildable {

    override init(dependency: SignUpDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SignUpListener) -> SignUpRouting {
        let component = SignUpComponent(dependency: dependency)
        let viewController = SignUpViewController()
        let interactor = SignUpInteractor(presenter: viewController)
        interactor.listener = listener
        return SignUpRouter(interactor: interactor, viewController: viewController)
    }
}
