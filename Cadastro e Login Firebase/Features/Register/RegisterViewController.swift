//
//  RegisterViewController.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    let registerFooterView = RegisterFooterView()
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerViewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupView() {
        self.title = "Cadastrar dados"
        self.view.backgroundColor = .white
        registerView.setupTableViewDelegate(parent: self)
        self.view = registerView
        self.registerFooterView.backAction = self.clickedBack
        self.registerFooterView.registerAction = self.clickedRegister
    }
    
    private func clickedRegister() {
        self.registerViewModel.doRegister()
    }
    
    private func clickedBack() {
        self.registerViewModel.doBack()
    }
    
    private func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { alertAction in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(ok)
        self.present(alertController, animated: true)
    }
}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaceHolderValues.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterCell.identifier, for: indexPath) as? RegisterCell
        let text = PlaceHolderValues.allCases[indexPath.row].rawValue
        cell?.configureCell(text: text, tag: indexPath.row, parent: self)
        cell?.selectionStyle = .none
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return registerFooterView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return RegisterFooterView.height
    }
}

extension RegisterViewController: RegisterViewModelDelegate {
    func registerOnSuccessPush() {
        
        alert(title: registerViewModel.title, message: registerViewModel.message)
        
        //navigationController?.popViewController(animated: true)
    }
    
    func registerBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc func valueChanged(_ textField: UITextField) {
        registerViewModel.newRegister(textField)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.isFirstResponder
    }
}
