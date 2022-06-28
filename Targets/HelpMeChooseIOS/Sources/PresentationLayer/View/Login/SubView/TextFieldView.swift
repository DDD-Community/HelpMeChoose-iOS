//
//  TextFieldView.swift
//  HelpMeChooseIOS
//
//  Created by 강지윤 on 2022/06/26.
//  Copyright © 2022 JYKang. All rights reserved.
//

import UIKit
import Then
import SnapKit

final class TextFieldView: UIStackView{
    
    lazy var topItemView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 7
        $0.alignment = .center
        $0.addArrangedSubview(iconImageView)
        $0.addArrangedSubview(titleLabel)
    }
    
    let iconImageView = UIImageView().then {
//        $0.contentMode = .scaleAspectFill
        $0.snp.makeConstraints { make in
            make.width.height.equalTo(16)
        }
    }
    
    let titleLabel = UILabel().then {
        $0.font = .mediumFont()
        $0.textAlignment = .left
    }
    
    let textField = PaddingTextField(padding: UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)).then{
        $0.backgroundColor = ._F3F3F3
        $0.layer.cornerRadius = 8
        $0.clearButtonMode = .whileEditing
        $0.clearButtonMode = .never
        $0.addDoneButton(title: "닫기", target: self, selector: #selector(doneAction))
    }
    
    let errorLabel = UILabel().then {
        $0.font = .mediumFont(size: 12)
        $0.textAlignment = .left
    }
    
    var action: (() -> ())? = nil
    
    init() {
        super.init(frame: .zero)
        makeUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        makeUI()
    }
    
    private func makeUI(){
        axis = .vertical
        spacing = 12
        distribution = .fill
        addArrangedSubview(topItemView)
        addArrangedSubview(textField)
    }
    
    func addErrorLabel(text: String){
        addArrangedSubview(errorLabel)
        errorLabel.text = text
    }
    
    
    @objc func doneAction(sender: Any) {
        action?()
    }
    
}


