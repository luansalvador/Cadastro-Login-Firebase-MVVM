//
//  UserModel.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import Foundation

struct UserModel {
    var name: String
    var email: String
    var phone: String
    var password: String
    var confirmPassword: String
    
    init() {
        self.name = String()
        self.email = String()
        self.phone = String()
        self.password = String()
        self.confirmPassword = String()
    }
    
    init(name: String, email: String, phone: String, password: String, confirmPassword: String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
