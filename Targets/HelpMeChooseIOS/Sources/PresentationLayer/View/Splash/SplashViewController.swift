//
//  SplashViewController.swift
//  HelpMeChooseIOS
//
//  Created by CanlabLee on 2022/06/06.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs
import UIKit

protocol SplashPresentableListener: AnyObject {
    func closeSplash()
}

final class SplashViewController: UIViewController, SplashPresentable, SplashViewControllable {

    weak var listener: SplashPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.listener?.closeSplash()
        }
    }
}
