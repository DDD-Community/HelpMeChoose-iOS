//
//  SignUpViewController.swift
//  HelpMeChooseIOS
//
//  Created by 강지윤 on 2022/06/26.
//  Copyright © 2022 JYKang. All rights reserved.
//

import RIBs
import UIKit
import Then
import SnapKit

protocol SignUpPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SignUpViewController: UIViewController, SignUpPresentable, SignUpViewControllable {

    weak var listener: SignUpPresentableListener?
    
    lazy var mainScrollView = UIScrollView().then{
        $0.addSubview(contentView)
    }
    
    lazy var contentView = UIView().then{
        $0.addSubview(titleLabel)
        $0.addSubview(nicknameTextField)
        $0.addSubview(emailTextField)
        $0.addSubview(passwordTextField)
        $0.addSubview(passwordCheckTextField)
        $0.addSubview(loginButton)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "회원가입"
        $0.font = .boldFont(size: 26)
        $0.numberOfLines = 2
    }
    
    private lazy var nicknameTextField = TextFieldView().then{
        $0.iconImageView.isHidden = true
        $0.titleLabel.text = "닉네임"
        $0.textField.placeholder = "닉네임 입력"
        $0.addErrorLabel(text: "닉네임은 한글, 영어, 숫자를 사용하여 3~8글자까지 가능합니다.")
        $0.action = { [weak self] in self?.keyboardDown() }
    }

    private lazy var emailTextField = TextFieldView().then{
        $0.iconImageView.image = UIImage(named: "LoginPassword")
        $0.titleLabel.text = "이메일"
        $0.textField.placeholder = "이메일"
        $0.action = { [weak self] in self?.keyboardDown() }
    }
    
    private lazy var passwordTextField = TextFieldView().then{
        $0.iconImageView.image = UIImage(named: "LoginPassword")
        $0.titleLabel.text = "비밀번호"
        $0.textField.placeholder = "비밀번호를 입력"
        $0.action = { [weak self] in self?.keyboardDown() }
    }
   
    private lazy var passwordCheckTextField = TextFieldView().then{
        $0.iconImageView.image = UIImage(named: "LoginPassword")
        $0.titleLabel.text = "비밀번호 재입력"
        $0.textField.placeholder = "비밀번호를 입력해주세요"
        $0.action = { [weak self] in self?.keyboardDown() }
    }
    
    
    private let loginButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .boldFont(size: 13)
        $0.backgroundColor = ._F8600D
        $0.layer.cornerRadius = 8
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
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(24)
            make.height.equalTo(48)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
       
        
    }
    
}
