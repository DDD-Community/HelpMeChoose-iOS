//
//  RootViewController.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/07.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs
import UIKit

protocol RootPresentableListener: AnyObject {}

final class RootViewController: UIViewController {
    weak var listener: RootPresentableListener?

    // MARK: - Private
    private var animationInProgress = false
    private var targetViewController: ViewControllable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension RootViewController: RootViewControllable {
    func replace(viewController: ViewControllable?) {
        targetViewController = viewController
        
        guard !animationInProgress else {
            return
        }

        if presentedViewController != nil {
            animationInProgress = true
            dismiss(animated: true) { [weak self] in
                if self?.targetViewController != nil {
                    self?.presentTargetViewController()
                } else {
                    self?.animationInProgress = false
                }
            }
        } else {
            presentTargetViewController()
        }
    }
    
    private func presentTargetViewController() {
        if let targetViewController = targetViewController {
            animationInProgress = true
            targetViewController.uiviewController.modalPresentationStyle = .fullScreen
            present(targetViewController.uiviewController, animated: false) { [weak self] in
                self?.animationInProgress = false
            }
        }
    }
}

extension RootViewController: RootPresentable {
    
}
