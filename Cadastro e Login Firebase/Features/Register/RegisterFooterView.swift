//
//  RegisterFooterView.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import UIKit

class RegisterFooterView: UIView {
    
    var registerAction: (() -> Void)?
    var backAction: (() -> Void)?
    
    static let height: CGFloat = 100
    
    private lazy var btRegister: DefaultButton = {
        let view = DefaultButton(title: "Cadastrar")
        view.addTarget(self, action: #selector(performRegister), for: .touchUpInside)
        return view
    }()
    
    private lazy var btBack: DefaultButton = {
        let view = DefaultButton(title: "Voltar")
        view.addTarget(self, action: #selector(performBack), for: .touchUpInside)
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(btRegister)
        self.addSubview(btBack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.btBack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.btBack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.btBack.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -8),
            self.btBack.heightAnchor.constraint(equalToConstant: 44),
            
            self.btRegister.centerYAnchor.constraint(equalTo: self.btBack.centerYAnchor),
            self.btRegister.widthAnchor.constraint(equalTo: self.btBack.widthAnchor),
            self.btRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.btRegister.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func performRegister() {
        self.registerAction?()
    }
    
    @objc private func performBack() {
        self.backAction?()
    }
}
