//
//  OnboardingView.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import UIKit

class OnboardingView: UIView {
    
    var actionRegister: (() -> Void)?
    var loginAction: (() -> Void)?
    public var buttonBottomConstraint: NSLayoutConstraint?
    
    private lazy var lbTopText: DefaultLabel = {
        let view = DefaultLabel(text: "Entre no App ou crie uma conta")
        view.textColor = UIColor.et_headerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lbAskEmailAndPassword: DefaultLabel = {
        let view = DefaultLabel(text: "Informe seu e-mail de cadastro e senha")
        view.font = UIFont.boldSystemFont(ofSize: 32)
        view.numberOfLines = 0
        view.textColor = UIColor.gray
        return view
    }()
    
    private lazy var tfEmail: DefaultTextField = {
        let view = DefaultTextField(placeHolder: "E-mail:")
        view.keyboardType = .emailAddress
        view.tag = 0
        view.addBottomBorder()
        return view
    }()
    
    private lazy var tfPassword: DefaultTextField = {
        let view = DefaultTextField(placeHolder: "Senha")
        view.tag = 1
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var btSign: DefaultButton = {
        let view = DefaultButton(title: "Criar conta")
        view.addTarget(self, action: #selector(performRegister), for: .touchUpInside)
        return view
    }()
    
    private lazy var btLogin: DefaultButton = {
        let view = DefaultButton(title: "Entrar")
        view.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
        return view
    }()
    
    private lazy var btForgotPassword: UIButton = {
        let view = UIButton()
        view.setTitle("Esqueceu a senha?", for: .normal)
        view.setTitleColor(UIColor.primaryColor, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        setupAdtionalConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tfEmail.addBottomBorder()
        tfPassword.addBottomBorder()
    }
    
    private func setupView() {
        self.addSubview(lbTopText)
        self.addSubview(lbAskEmailAndPassword)
        self.addSubview(tfEmail)
        self.addSubview(tfPassword)
        self.addSubview(btSign)
        self.addSubview(btLogin)
        self.addSubview(btForgotPassword)
    }
    
    private func setupConstraints() {
        
        self.buttonBottomConstraint = self.btForgotPassword.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
            
            self.lbTopText.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.lbTopText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.lbTopText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.lbAskEmailAndPassword.topAnchor.constraint(equalTo: self.lbTopText.bottomAnchor, constant: 16),
            self.lbAskEmailAndPassword.leadingAnchor.constraint(equalTo: self.lbTopText.leadingAnchor),
            self.lbAskEmailAndPassword.trailingAnchor.constraint(equalTo: self.lbTopText.trailingAnchor),
            
            self.tfEmail.topAnchor.constraint(equalTo: self.lbAskEmailAndPassword.bottomAnchor, constant: 16),
            self.tfEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.tfEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.tfEmail.heightAnchor.constraint(equalToConstant: 44),
            
            self.tfPassword.topAnchor.constraint(equalTo: self.tfEmail.bottomAnchor, constant: 28),
            self.tfPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.tfPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.tfPassword.heightAnchor.constraint(equalToConstant: 44),
            
            self.buttonBottomConstraint!,
            self.btForgotPassword.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.btForgotPassword.widthAnchor.constraint(equalToConstant: 180),
        
            self.btSign.bottomAnchor.constraint(equalTo: self.btForgotPassword.topAnchor, constant: -16),
            self.btSign.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.btSign.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -8),
            self.btSign.heightAnchor.constraint(equalToConstant: 44),
            
            self.btLogin.bottomAnchor.constraint(equalTo: self.btSign.bottomAnchor),
            self.btLogin.widthAnchor.constraint(equalTo: self.btSign.widthAnchor),
            self.btLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.btLogin.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupAdtionalConfig() {
        self.backgroundColor = .systemBackground
    }
    
    @objc private func performRegister() {
        self.actionRegister?()
    }
    
    @objc private func performLogin() {
        self.loginAction?()
    }
    
    public func getTfEmail() -> UITextField {
        return self.tfEmail
    }
    
    public func getTfPassword() -> UITextField {
        return self.tfPassword
    }
    
    public func setupDelegate(delegate: UITextFieldDelegate?) {
        self.tfEmail.delegate = delegate
        self.tfPassword.delegate = delegate
    }
    
    public func getBtForgetPassword() -> UIButton {
        return btForgotPassword
    }
    
    public func getConstraints() -> Any {
        return setupConstraints()
    }
}

