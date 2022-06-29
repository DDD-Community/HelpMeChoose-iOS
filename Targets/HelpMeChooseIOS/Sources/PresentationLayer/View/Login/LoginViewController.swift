//
//  LoginViewController.swift
//  HelpMeChooseIOS
//
//  Created by 강지윤 on 2022/06/21.
//  Copyright © 2022 JYKang. All rights reserved.
//

import RIBs
import UIKit
import SnapKit
import Then

protocol LoginPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoginViewController: UIViewController, LoginPresentable, LoginViewControllable {

    weak var listener: LoginPresentableListener?
    
    lazy var mainScrollView = UIScrollView().then{
        $0.addSubview(contentView)
    }
    
    lazy var contentView = UIView().then{
        $0.addSubview(titleLabel)
        $0.addSubview(emailTextField)
        $0.addSubview(passwordTextField)
        $0.addSubview(loginButton)
        $0.addSubview(findPasswordButton)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "안녕하세요 !\n로그인을 해주세요"
        $0.font = .boldFont(size: 26)
        $0.numberOfLines = 2
    }
    
    private lazy var emailTextField = TextFieldView().then{
        $0.iconImageView.image = UIImage(named: "LoginMy")
        $0.titleLabel.text = "이메일 아이디"
        $0.textField.placeholder = "이메일을 입력해 주세요"
        $0.action = { [weak self] in self?.keyboardDown() }
    }
    
    private lazy var passwordTextField = TextFieldView().then{
        $0.iconImageView.image = UIImage(named: "LoginPassword")
        $0.titleLabel.text = "비밀번호"
        $0.textField.placeholder = "비밀번호를 입력해주세요"
        $0.action = { [weak self] in self?.keyboardDown() }
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .boldFont(size: 13)
        $0.backgroundColor = ._D9D9D9
        $0.layer.cornerRadius = 8
    }
    
    private let findPasswordButton = UIButton().then{
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(._9E9E9E, for: .normal)
        $0.titleLabel?.font = .mediumFont(size: 12)
        $0.backgroundColor = .clear
    }
    

    override func viewDidLoad() {
        view.backgroundColor = .white
        makeUI()
    }
    
    private func makeUI(){
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view) // 스크롤뷰가 표현될 영역
        }
        
       
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.height.equalTo(44)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        findPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
    }
    
    
}
