//
//  RootRouter.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs
import UIKit.UIWindow

protocol RootInteractable: Interactable, SplashListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func replace(viewController: ViewControllable?)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    init(
        window: UIWindow,
        interactor: RootInteractable,
        viewController: RootViewControllable,
        splashBuilder: SplashBuildable
    ) {
        self.window = window
        self.splashBuilder = splashBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
        routeToSplash()
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }

    // MARK: - Private
    private let window: UIWindow
    private let splashBuilder: SplashBuildable
    private var currentChild: ViewableRouting?
    
    func routeToSplash() {
        let splash = splashBuilder.build(withListener: interactor)
        self.currentChild = splash
        attachChild(splash)
        viewController.replace(viewController: splash.viewControllable)
    }
    
    func routeToMain() {
        
    }
    
    func detechChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.replace(viewController: nil)
        }
    }
}
