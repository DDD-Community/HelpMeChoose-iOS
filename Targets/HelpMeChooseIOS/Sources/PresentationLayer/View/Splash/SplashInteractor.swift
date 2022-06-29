//
//  SplashInteractor.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import RIBs
import RxSwift
import RxRelay

protocol SplashRouting: ViewableRouting {
    func attachLoginRIB()
    func detachLoginRIB()
    func attachSignUpRIB()
    func detachSignUpRIB()
}

protocol SplashPresentable: Presentable {
    var listener: SplashPresentableListener? { get set }
    var showLogin: PublishRelay<Void> { get }
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
        
        bindPresenter()
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

private extension SplashInteractor {
    fileprivate func bindPresenter() {
        presenter.showLogin
            .subscribe(onNext: { [weak self] in
                guard let this = self, let router = this.router else { return }
                router.attachSignUpRIB()
            })
            .disposeOnDeactivate(interactor: self)
    }
}
