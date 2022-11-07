//
//  DefaultTextField.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 06/11/22.
//

import UIKit

class DefaultTextField: UITextField {    
    
    init(placeHolder: String?) {
        super.init(frame: .zero)
        configureTextField(placeHolder: placeHolder ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField(placeHolder: String) {
        self.placeholder = placeHolder
        self.layer.cornerRadius = 21
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentVerticalAlignment = .bottom
        self.textColor = UIColor.et_headerColor
        
    }
}
