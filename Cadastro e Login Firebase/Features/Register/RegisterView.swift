//
//  RegisterView.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import UIKit

class RegisterView: UIView {
    
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
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupAditionalConfigurations() {
        self.backgroundColor = .white
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
