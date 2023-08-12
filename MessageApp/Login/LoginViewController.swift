//
//  ViewController.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 23/07/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    private var screen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackground()
        screen?.configTextFieldDelegate(delegate: self)
        screen?.setDelegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }

    private func configBackground() {
        view.backgroundColor = .lightGray
    }

}

extension LoginViewController: LoginScreenProtocol {
    func actionLogin() {
        let viewController = HomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
        guard let login = screen else {return}

        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
            if error != nil {
                self.alert?.showAlertInformation(title: "Atenção", message: "Dados incorreto!, verifique e tente novamente")
            } else {
                if usuario == nil {
                    self.alert?.showAlertInformation(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
                } else {
                    print("Parabéns, usuario logado com sucesso!!")
                }
            }
        })
        
    }
    
    func actionRegister() {
        let viewController = RegisterViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validationTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
