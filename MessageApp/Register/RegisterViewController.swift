//
//  RegisterViewController.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 23/07/23.
//

import UIKit

class RegisterViewController: UIViewController {

    private var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
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

extension RegisterViewController: RegisterScreenProtocol {
    func actionRegisterButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
