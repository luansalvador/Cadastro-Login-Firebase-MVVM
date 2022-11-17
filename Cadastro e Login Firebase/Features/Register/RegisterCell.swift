//
//  RegisterCell.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import UIKit

class RegisterCell: UITableViewCell {
    
    static let identifier: String = "RegisterTableViewCell"
    
    private lazy var lbTtitleField: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.textColor = .black
        view.placeholder = "Escreva aqui"
        view.contentVerticalAlignment = .bottom
        view.textColor = UIColor.et_headerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(lbTtitleField)
        self.contentView.addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.lbTtitleField.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            self.lbTtitleField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.lbTtitleField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.textField.topAnchor.constraint(equalTo: self.lbTtitleField.bottomAnchor, constant: 3),
            self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
        ])
    }
}

extension RegisterCell: ConfigurableCellProtocol {
    
    func configureCell(text: String?,
                       tag: Int,
                       parent: UITextFieldDelegate?) {
        self.lbTtitleField.text = text
        self.textField.tag = tag
        self.textField.delegate = parent
    }
}
