//
//  RegisterViewController.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 23/07/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    private var screen: RegisterScreen?
    var alert: Alert?
    var auth: Auth?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackground()
        screen?.setDelegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
    
    private func configBackground() {
        view.backgroundColor = .lightGray
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = screen else {return}
        
        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            
            if error != nil {
                self.alert?.showAlertInformation(title: "Atenção", message: "Erro ao registrar, verifique os dados e tente novamente")
            } else {
                self.alert?.showAlertInformation(title: "Parabéns", message: "Usuário cadastrado com sucesso!", completion: {_ in
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
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
