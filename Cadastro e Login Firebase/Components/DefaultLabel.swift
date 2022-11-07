//
//  DefaultLabel.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 07/11/22.
//

import UIKit

class DefaultLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.setupLabelConfig(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabelConfig(text: String) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
