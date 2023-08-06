//
//  ViewController.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 23/07/23.
//

import UIKit

class LoginViewController: UIViewController {

    private var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackground()
        screen?.setDelegate(delegate: self)
    }

    private func configBackground() {
        view.backgroundColor = .lightGray
    }

}

extension LoginViewController: LoginScreenProtocol {
    func actionLogin() {
        <#code#>
    }
    
    func actionRegister() {
        <#code#>
    }
    
    
}
