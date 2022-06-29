//
//  SplashViewController.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import RIBs
import RxSwift
import RxRelay
import UIKit

protocol SplashPresentableListener: AnyObject {
    func closeSplash()
}

final class SplashViewController: UIViewController, SplashPresentable, SplashViewControllable {
    weak var listener: SplashPresentableListener?
    
    var showLogin: PublishRelay<Void> = PublishRelay<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        listener?.closeSplash()
       
        showLogin.accept(Void())
        
    }
    
    func present(_ viewController: ViewControllable, animated: Bool) {
        present(viewController.uiviewController, animated: animated)
    }
    
    func dismiss(_ viewController: ViewControllable, animated: Bool) {
        guard !viewController.uiviewController.isBeingDismissed else { return }
        viewController.uiviewController.dismiss(animated: animated)
    }
    
    
}
