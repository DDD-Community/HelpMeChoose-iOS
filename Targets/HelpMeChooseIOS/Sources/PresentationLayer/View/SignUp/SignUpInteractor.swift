//
//  SignUpInteractor.swift
//  HelpMeChooseIOS
//
//  Created by 강지윤 on 2022/06/26.
//  Copyright © 2022 JYKang. All rights reserved.
//

import RIBs

protocol SignUpRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SignUpPresentable: Presentable {
    var listener: SignUpPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SignUpListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SignUpInteractor: PresentableInteractor<SignUpPresentable>, SignUpInteractable, SignUpPresentableListener {

    weak var router: SignUpRouting?
    weak var listener: SignUpListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SignUpPresentable) {
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
