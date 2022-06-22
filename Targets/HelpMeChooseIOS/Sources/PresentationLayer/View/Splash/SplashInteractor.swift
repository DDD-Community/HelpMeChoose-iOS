//
//  SplashInteractor.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs
import Combine

protocol SplashRouting: ViewableRouting {
    func attachLoginRIB()
    func detachLoginRIB()
}

protocol SplashPresentable: Presentable {
    var listener: SplashPresentableListener? { get set }
    var showLogin: PassthroughSubject<Void, Never> { get }
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
    private func bindPresenter(){
        presenter.showLogin
            .sink(receiveValue: { [weak self] _ in // receiveValue : 값을 받을 때 실행하는 클로저
                guard let self = self, let router = self.router else { return }
                router.attachLoginRIB()
            })
            .cancelOnDeactivate(interactor: self)
    }
}
