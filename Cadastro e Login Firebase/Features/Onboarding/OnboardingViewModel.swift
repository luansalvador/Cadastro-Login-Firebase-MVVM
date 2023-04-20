//
//  OnboardingViewModel.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import Foundation
import FirebaseAuth
import Firebase

protocol OnboardingViewModelDelegate: AnyObject {
    func registerOnSucessPush()
    func loginOnSucessPush()
}

final class OnboardingViewModel {
    
    weak var delegate: OnboardingViewModelDelegate?
    
    public var title: String = ""
    public var message: String = ""
    
    private var emailLogin: String = ""
    private var passwordLogin: String = ""
    
    public func doRegister() {
        self.delegate?.registerOnSucessPush()
    }
    
    public func loginSuccess() {
        
        Auth.auth().signIn(withEmail: emailLogin, password: passwordLogin) { authData, error in
            if error == nil {
                self.delegate?.loginOnSucessPush()
            } else {
                print("Falha no login")
            }
        }
    }
    
    public func setLogin(email: String, password: String) {
        self.emailLogin = email
        self.passwordLogin = password
    }
}
