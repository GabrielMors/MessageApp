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
    var firestore: Firestore?
    
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
        firestore = Firestore.firestore()
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
                
                if let idUser = result?.user.uid {
                    self.firestore?.collection("users").document(idUser).setData([
                        "name": self.screen?.getName() ?? "",
                        "email": self.screen?.getEmail() ?? "",
                        "id": idUser
                    ])
                }
                
                self.alert?.showAlertInformation(title: "Parabéns", message: "Usuário cadastrado com sucesso!", completion: {_ in 
                    let viewController = HomeViewController()
                    let navigationVC = UINavigationController(rootViewController: viewController)
                    navigationVC.modalPresentationStyle = .fullScreen
                    self.present(navigationVC, animated: true, completion: nil)
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
