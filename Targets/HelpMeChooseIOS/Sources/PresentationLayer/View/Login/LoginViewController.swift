//
//  LoginViewController.swift
//  HelpMeChooseIOS
//
//  Created by 강지윤 on 2022/06/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import ModernRIBs
import UIKit

protocol LoginPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {

    weak var listener: LoginPresentableListener?
    
    
    override func viewDidLoad() {
        print("보여진다")
    }
    
    
}
