//
//  LoginScreen.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 23/07/23.
//

import UIKit

class LoginScreen: UIView {

    lazy var gmLogoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "message.badge.filled.fill")
        image.tintColor = UIColor.darkGray
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "Type your e-mail"
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .default
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "Type your password"
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .default
        textField.backgroundColor = .white
        
        return textField
    }()
    
    lazy var EnterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedButton() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setConstraints()
        addLeftPadding(to: emailTextField)
        addLeftPadding(to: passwordTextField)
        addBorder(to: emailTextField)
        addBorder(to: passwordTextField)
    }
    
    private func addLeftPadding(to textField: UITextField) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftView
        textField.leftViewMode = .always
    }
    
    private func addBorder(to: UITextField) {
        to.layer.borderWidth = 1.5
        to.layer.borderColor = UIColor.darkGray.cgColor
        to.layer.cornerRadius = 15
    }
    
    private func addElements() {
        addSubview(gmLogoImage)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(EnterButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            gmLogoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            gmLogoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            gmLogoImage.heightAnchor.constraint(equalToConstant: 120),
            gmLogoImage.widthAnchor.constraint(equalToConstant: 120),
            
            emailLabel.topAnchor.constraint(equalTo: gmLogoImage.bottomAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 2),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            EnterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            EnterButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            EnterButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            EnterButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}