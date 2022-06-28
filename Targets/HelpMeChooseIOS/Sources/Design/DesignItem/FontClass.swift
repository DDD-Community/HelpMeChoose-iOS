//
//  FontClass.swift
//  HelpMeChooseIOS
//
//  Created by 강지윤 on 2022/06/26.
//  Copyright © 2022 JYKang. All rights reserved.
//

import Foundation
import UIKit
extension UIFont{
    static func blackFont(size: CGFloat = 14) -> UIFont {
        return .systemFont(ofSize: size, weight: .black)
    }
    static func regularFont(size: CGFloat = 14) -> UIFont {
        return .systemFont(ofSize: size, weight: .regular)
    }
    static func mediumFont(size: CGFloat = 14) -> UIFont {
        return .systemFont(ofSize: size, weight: .medium)
    }
    static func boldFont(size: CGFloat = 14) -> UIFont {
        return .systemFont(ofSize: size, weight: .bold)
    }
    
    
}
