//
//  RegisterView.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import UIKit

class RegisterView: UIView {
    
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
    
    private lazy var tableView: UITableView = {
        //Delegate is register by ViewController for func setupTableViewDelegate
        let view = UITableView(frame: .zero, style: .plain)
        view.register(RegisterCell.self, forCellReuseIdentifier: RegisterCell.identifier)
        view.separatorColor = UIColor.et_headerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        setupAditionalConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView() {
        self.addSubview(tableView)
        self.addSubview(btBack)
        self.addSubview(btRegister)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.btBack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.btBack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.btBack.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -8),
            self.btBack.heightAnchor.constraint(equalToConstant: 44),
            
            self.btRegister.bottomAnchor.constraint(equalTo: self.btBack.bottomAnchor),
            self.btRegister.widthAnchor.constraint(equalTo: self.btBack.widthAnchor),
            self.btRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.btRegister.heightAnchor.constraint(equalToConstant: 44),
            
            self.tableView.bottomAnchor.constraint(equalTo: self.btBack.topAnchor, constant: -16)
        ])
    }
    
    private func setupAditionalConfigurations() {
        self.backgroundColor = .white
    }
    
    @objc private func performRegister() {
        self.registerAction?()
    }
    
    @objc private func performBack() {
        self.backAction?()
    }
    
    public func setupTableView() {
        self.tableView.endEditing(true)
    }
    
    public func setupTableViewDelegate(parent: UITableViewDelegate & UITableViewDataSource) {
        self.tableView.delegate = parent
        self.tableView.dataSource = parent
    }
    
    public func getTableView() -> UITableView {
        return self.tableView
    }
}
