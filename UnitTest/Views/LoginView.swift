//
//  LoginView.swift
//  UnitTest
//
//  Created by sarath kumar on 12/10/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    var loginAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let stackView = mainStackView()
        
        addSubview(stackView)
        
        stackView.setAnchor(width: self.frame.width - 60, height: 170)
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func mainStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [userNameTextField,passwordTextField,LoginButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }
    
    @objc func loginButtonAction() {
        loginAction?()
    }
    
    let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.returnKeyType = .continue
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        textField.attributedText = placeHolder
        textField.setLeftPaddingPoints(5)
        textField.setAnchor(width: 0, height: 40)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.returnKeyType = .done
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        textField.attributedText = placeHolder
        textField.setLeftPaddingPoints(5)
        textField.setAnchor(width: 0, height: 40)
        return textField
    }()
    
    let LoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 12
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        button.setAnchor(width: 0, height: 50)
        return button
    }()
}
