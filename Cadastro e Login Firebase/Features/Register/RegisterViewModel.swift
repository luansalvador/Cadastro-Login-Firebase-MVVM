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
    case emailTextField
    case phoneTextField
    case passwordTextField
    case confirmPasswordTextField
}

enum PlaceHolderValues: String, CaseIterable {
    case name = "Nome Completo:"
    case email = "E-mail:"
    case phone = "Celular:"
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
    private var email: String?
    private var phone: String?
    private var password: String?
    private var confirmPassword: String?
    
    public var title: String = ""
    public var message: String = ""
    
    weak var delegate: RegisterViewModelDelegate?
    
    static var registerUser: UserModel = UserModel(name: "luan salvador", email: "luan@gmail.com", phone: "11111111111", password: "123456", confirmPassword: "123456")
    
    public func newRegister(_ textField: UITextField) {
        
        switch textField.tag {
            case TextFieldData.nameTextField.rawValue:
                RegisterViewModel.registerUser.name = textField.text ?? ""
            
            case TextFieldData.emailTextField.rawValue:
                RegisterViewModel.registerUser.email = textField.text ?? ""
            
            case TextFieldData.phoneTextField.rawValue:
                RegisterViewModel.registerUser.phone = textField.text ?? ""
    
            case TextFieldData.passwordTextField.rawValue:
                RegisterViewModel.registerUser.password = textField.text ?? ""
            
            case TextFieldData.confirmPasswordTextField.rawValue:
                RegisterViewModel.registerUser.confirmPassword = textField.text ?? ""
            
            default:
                break
        }
    }
    
    public func doRegister() {
        let userBusiness = UserBusiness()
        let userManager = UserManager(business: userBusiness)
        
        //FAZER A VALIDAÇÃO DO REGISTRO E PASSAR AS INFORMAÇÕES VALIDADAS ABAIXO
        userManager.register(name: RegisterViewModel.registerUser.name,
                             email: RegisterViewModel.registerUser.email,
                             phone: RegisterViewModel.registerUser.phone,
                             password: RegisterViewModel.registerUser.password,
                             confirmPassword: RegisterViewModel.registerUser.confirmPassword) { userModel in
            switch userModel {
                
            case .success(_):
                self.title = "Sucesso"
                self.message = "Cadastro realizado"
                self.delegate?.registerOnSuccessPush()
            case .failure(_):
                print("Falha ao cadastrar")
            }
        }
    }
    
    public func doBack() {
        self.delegate?.registerBack()
    }
    
    public func getIndexPath(for textField: UITextField, tableView: UITableView) -> IndexPath? {
        let point = textField.convert(textField.bounds.origin, to: tableView)
        return tableView.indexPathForRow(at: point)
    }
    
    public func jumpToNextTextField(textField: UITextField, tableView: UITableView) {
        if let indexPath = self.getIndexPath(for: textField, tableView: tableView), let nextCell = tableView.cellForRow(at: IndexPath(row: indexPath.row + 1, section: indexPath.section)) as? RegisterCell {
            nextCell.getTf().becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
}
