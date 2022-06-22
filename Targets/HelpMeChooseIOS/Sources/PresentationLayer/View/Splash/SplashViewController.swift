//
//  SplashViewController.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs
import CombineCocoa
import Combine
import UIKit

protocol SplashPresentableListener: AnyObject {
    func closeSplash()
}

final class SplashViewController: UIViewController, SplashPresentable, SplashViewControllable {
   
    

    weak var listener: SplashPresentableListener?
    var showLogin: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        listener?.closeSplash()
       
        showLogin.send(())
        
    }
    
    func present(_ viewController: ViewControllable, animated: Bool) {
        present(viewController.uiviewController, animated: animated)
    }
    
    func dismiss(_ viewController: ViewControllable, animated: Bool) {
        guard !viewController.uiviewController.isBeingDismissed else { return }
        viewController.uiviewController.dismiss(animated: animated)
    }
}
