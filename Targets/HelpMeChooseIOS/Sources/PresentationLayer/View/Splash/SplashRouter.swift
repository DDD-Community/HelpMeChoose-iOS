//
//  SplashRouter.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs

protocol SplashInteractable: Interactable, LoginListener {
    var router: SplashRouting? { get set }
    var listener: SplashListener? { get set }
}

protocol SplashViewControllable: ViewControllable {
    func present(_ viewController: ViewControllable, animated: Bool)
    func dismiss(_ viewController: ViewControllable, animated: Bool)
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SplashRouter: ViewableRouter<SplashInteractable, SplashViewControllable>, SplashRouting {
   
    
    
    private let loginBuilder: LoginBuilder
    private var loginRouter: LoginRouting?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        loginBuilder: LoginBuilder,
        interactor: SplashInteractable,
        viewController: SplashViewControllable
    ) {
        self.loginBuilder = loginBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    
    func attachLoginRIB() {
        let router = loginBuilder.build(withListener: interactor)
        loginRouter = router
        attachChild(router)
        
        viewController.present(router.viewControllable, animated: true)
    }
    
    
    func detachLoginRIB() {
        guard let router = loginRouter else { return }
        viewController.dismiss(router.viewControllable, animated: true)
        detachChild(router)
        loginRouter = nil
    }
    
}
