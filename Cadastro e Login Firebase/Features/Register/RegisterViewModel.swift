//
//  RegisterViewModel.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import Foundation
import UIKit
import FirebaseAuth

enum TextFieldData: Int {
    case nameTextField = 0
    case cpfTextField
    case emailTextField
    case phoneTextField
    case birthDateTextField
    case passwordTextField
    case confirmPasswordTextField
}

enum PlaceHolderValues: String, CaseIterable {
    case name = "Nome Completo:"
    case cpf = "CPF:"
    case email = "E-mail:"
    case phone = "Celular:"
    case birthDate = "Data de Nascimento:"
    case password = "Senha:"
    case confirmPassword = "Confirmar Senha:"
}

protocol ConfigurableCellProtocol {
    func configureCell(text: String?,
                       tag: Int,
                       parent: UITextFieldDelegate?)
}

protocol RegisterViewModelDelegate: AnyObject {
    func registerOnSuccessPush()
    func registerBack()
}

class RegisterViewModel {
    
    private var name: String?
    private var cpf: String?
    private var email: String?
    private var phone: String?
    private var birthDate: String?
    private var password: String?
    private var confirmPassword: String?
    
    public var title: String = ""
    public var message: String = ""
    
    weak var delegate: RegisterViewModelDelegate?
    
    static var registerUser: RegisterUser = RegisterUser(name: "luan salvador", cpf: "11111111111", email: "luan@gmail.com", phone: "11111111111", birthDate: "xx/xx/xxxx", password: "123456", confirmPassword: "123456")
    
    public func newRegister(_ textField: UITextField) {
        
        switch textField.tag {
            case TextFieldData.nameTextField.rawValue:
                RegisterViewModel.registerUser.name = textField.text ?? ""
            
            case TextFieldData.cpfTextField.rawValue:
                RegisterViewModel.registerUser.cpf = textField.text ?? ""
            
            case TextFieldData.emailTextField.rawValue:
                RegisterViewModel.registerUser.email = textField.text ?? ""
            
            case TextFieldData.phoneTextField.rawValue:
                RegisterViewModel.registerUser.phone = textField.text ?? ""
            
            case TextFieldData.birthDateTextField.rawValue:
                RegisterViewModel.registerUser.birthDate = textField.text ?? ""
            
            case TextFieldData.passwordTextField.rawValue:
                RegisterViewModel.registerUser.password = textField.text ?? ""
            
            case TextFieldData.confirmPasswordTextField.rawValue:
                RegisterViewModel.registerUser.confirmPassword = textField.text ?? ""
            
            default:
                break
        }
    }
    
    public func doRegister() {
        Auth.auth().createUser(withEmail: RegisterViewModel.registerUser.email, password: RegisterViewModel.registerUser.password) { authResult, error in
            if error == nil {
                self.title = "Sucesso"
                self.message = "Cadastro realizado"
                self.delegate?.registerOnSuccessPush()
            } else {
                print("Falha ao cadastrar")
            }
        }
    }
    
    public func doBack() {
        self.delegate?.registerBack()
    }
}
