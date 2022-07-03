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
        return UIFont(name: "Pretendard-Black", size: size)!
    }
    static func regularFont(size: CGFloat = 14) -> UIFont {
        return UIFont(name: "Pretendard-Regular", size: size)!
    }
    static func mediumFont(size: CGFloat = 14) -> UIFont {
        return UIFont(name: "Pretendard-Medium", size: size)!
    }
    static func boldFont(size: CGFloat = 14) -> UIFont {
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
}
