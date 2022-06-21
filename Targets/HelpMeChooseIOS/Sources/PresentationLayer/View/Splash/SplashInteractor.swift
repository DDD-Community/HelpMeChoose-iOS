//
//  SplashInteractor.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs

protocol SplashRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SplashPresentable: Presentable {
    var listener: SplashPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SplashListener: AnyObject {
    func didCloseSplash()
}

final class SplashInteractor: PresentableInteractor<SplashPresentable>, SplashInteractable {

    weak var router: SplashRouting?
    weak var listener: SplashListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SplashPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension SplashInteractor: SplashPresentableListener {
    func closeSplash() {
        listener?.didCloseSplash()
    }
}
