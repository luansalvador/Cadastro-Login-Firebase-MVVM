//
//  UserManager.swift
//  Cadastro e Login Firebase
//
//  Created by sis on 23/05/23.
//

import Foundation

protocol UserManagerProtocol {
    func register(name: String, email: String, phone: String, password: String, confirmPassword: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    
    func login(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}

class UserManager: UserManagerProtocol {
    
    
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    func register(name: String, email: String, phone: String, password: String, confirmPassword: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        business.register(name: name, email: email, phone: phone, password: password, confirmPassword: confirmPassword) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        business.login(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }    
}
