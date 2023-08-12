//
//  HomeScreen.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 06/08/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var navView: NavigationView = {
        let view = NavigationView()
        view.backgroundColor = CustomColor.appLight
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.delaysContentTouches = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collection.setCollectionViewLayout(layout, animated: false)
        return collection
    }()
    
    public func delegateCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    public func reloadCollection() {
        self.collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        navView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(navView)
        addSubview(collectionView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            navView.topAnchor.constraint(equalTo: self.topAnchor),
            navView.trailingAnchor.constraint(equalTo: trailingAnchor),
            navView.leadingAnchor.constraint(equalTo: leadingAnchor),
            navView.heightAnchor.constraint(equalToConstant: 140),
            
            collectionView.topAnchor.constraint(equalTo: navView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }
    
    
    
}
