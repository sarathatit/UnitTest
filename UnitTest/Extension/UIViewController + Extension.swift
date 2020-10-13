//
//  UIViewController + Extension.swift
//  UnitTest
//
//  Created by sarath kumar on 12/10/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private func present(_ dismisableAlert: UIAlertController) {
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        dismisableAlert.addAction(dismissAction)
        present(dismisableAlert, animated: true)
    }
    
    func presentAlert(with Message: String) {
        let alert = UIAlertController(title: nil, message: Message, preferredStyle: .alert)
        present(alert)
    }
    
    func presentError(_ error: Error) {
        presentAlert(with: error.localizedDescription)
    }
}
