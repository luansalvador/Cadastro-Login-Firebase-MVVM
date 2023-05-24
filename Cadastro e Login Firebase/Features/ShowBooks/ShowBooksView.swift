//
//  ShowBooksView.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 20/04/23.
//

import Foundation
import UIKit

class ShowBooksView: UIView {
    
    //CRIAR TABLE VIEW E PASSAR NA QUANTIDADE DE LINHAS A MESMA QUANTIDADE DE LIVROS DA VAR BOOKS DA VIEW MODEL
    
    init() {
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
        self.setupAditionalConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
    }
    private func setupConstraints() {
        
    }
    
    private func setupAditionalConfig() {
        self.backgroundColor = .systemBackground
    }
}
