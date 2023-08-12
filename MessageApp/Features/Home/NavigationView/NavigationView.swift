//
//  NavigationView.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 12/08/23.
//

import UIKit

enum TypeScreenHome {
    case conversation
    case contact
}

protocol NavViewProtocol: AnyObject {
    func typeScreenMessage(type: TypeScreenHome)
}

class NavigationView: UIView {
    
    weak private var delegate: NavViewProtocol?
    
    public func setDelegate(delegate: NavViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var navBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var navigationBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var searchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.appLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite aqui"
        label.textColor = .lightGray
        label.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
        return label
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Search"), for: .normal)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    lazy var conversationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "message")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(tappedConversationButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedConversationButton() {
        self.delegate?.typeScreenMessage(type: .conversation)
        conversationButton.tintColor = .systemPink
        contactButton.tintColor = .black
    }
    
    lazy var contactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "group")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(self, action: #selector(tappedContactButtonButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedContactButtonButton() {
        self.delegate?.typeScreenMessage(type: .contact)
        contactButton.tintColor = .systemPink
        conversationButton.tintColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configStackView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configStackView(){
        stackView.addArrangedSubview(conversationButton)
        stackView.addArrangedSubview(contactButton)
    }
    
    private func addElementes() {
        addSubview(navBackgroundView)
        navBackgroundView.addSubview(navigationBar)
        navigationBar.addSubview(searchBar)
        navigationBar.addSubview(stackView)
        searchBar.addSubview(searchLabel)
        searchBar.addSubview(searchButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            navBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            navBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            navigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            searchBar.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 30),
            searchBar.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            searchBar.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            stackView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -30),
            stackView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            
            searchLabel.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 25),
            searchLabel.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            
            searchButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor,constant:-20),
            searchButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 20),
            searchButton.heightAnchor.constraint(equalToConstant: 20)
        
        ])
    }
}
