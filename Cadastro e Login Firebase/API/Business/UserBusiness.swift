//
//  UserBusiness.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 23/05/23.
//

import Foundation

protocol UserBusinessProtocol {
    
    func register(name: String, email: String, phone: String, password: String, confirmPassword: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
    
    func login(email: String, password: String, completionHandler: @escaping(Result<UserModel, Error>) -> Void)
}

class UserBusiness: UserBusinessProtocol {
    
    let provider: UserProvider = UserProvider()
    
    func register(name: String, email: String, phone: String, password: String, confirmPassword: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        let userModel = UserModel(name: name, email: email, phone: phone, password: password, confirmPassword: confirmPassword)
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body : [Constants.ParametersKeys.userModel: userModel]]
        
        provider.register(parameters: params) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        var userModel = UserModel()
        userModel.email = email
        userModel.password = password
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body : [Constants.ParametersKeys.userModel: userModel]]
        
        provider.login(parameters: params) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
