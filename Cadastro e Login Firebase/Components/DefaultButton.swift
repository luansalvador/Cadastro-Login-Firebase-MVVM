//
//  DefaultButton.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 06/11/22.
//

import UIKit

class DefaultButton: UIButton {
    
    public init(title: String) {
        super.init(frame: .zero)
        settingConfigButton(title: title)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupPrimaryGradient()
    }
    
    private func settingConfigButton(title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 21
        self.layer.borderWidth = 0.1
        self.setTitleColor(UIColor.white, for: .normal)
    }
}


