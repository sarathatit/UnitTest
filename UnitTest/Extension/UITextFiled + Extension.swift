//
//  UITextFiled + Extension.swift
//  UnitTest
//
//  Created by sarath kumar on 12/10/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ space: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.frame.size.height
        ))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
