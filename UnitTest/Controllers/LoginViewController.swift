//
//  ViewController.swift
//  UnitTest
//
//  Created by sarath kumar on 12/10/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView!
    
    let data = [User(username: "sarath", password: "5313")]
    
    private var validation: ValidationService
 
    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Custom Methods
    
    func setupView() {
        let mainView = LoginView(frame: self.view.frame)
        self.loginView = mainView
        self.loginView.loginAction = LoginButtonAction
        view.addSubview(self.loginView)
    }
    
    // MARK: - Action Methods
    
    func LoginButtonAction() {
        do {
            let username = try validation.validateUsername(username: loginView.userNameTextField.text)
            let password = try validation.validatePassword(password: loginView.passwordTextField.text)
            
            if let user = data.first(where: { (user) in
                user.username == username && user.password == password
            }) {
                presentAlert(with: "login successfull with \(user.username)")
            } else {
                throw LoginError.invalidCredential
            }
            
        } catch  {
            presentError(error)
        }
        
    }
    
}

extension LoginViewController {
    enum LoginError: LocalizedError {
        case invalidCredential
        
        var errorDescription: String? {
            switch self {
            case .invalidCredential:
                return "Username or Password is incorrect!"
            }
        }
    }
}

