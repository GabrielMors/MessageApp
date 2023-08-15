//
//  LastetMessageCVC.swift
//  MessageApp
//
//  Created by Gabriel Mors  on 15/08/23.
//

import UIKit

class LastetMessageCVC: UICollectionViewCell {
    
    static var identifier : String = String(describing: LastetMessageCVC.self)
    
    lazy var Screen : LastetMessageCVCScreen = {
        let view = LastetMessageCVCScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementes(){
        addSubview(Screen)
    }
    
    private func configContraints(){
        Screen.pin(to: self)
    }
}
