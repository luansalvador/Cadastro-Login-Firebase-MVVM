//
//  OnboardingViewController.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 16/10/22.
//

import UIKit
import FirebaseAuth

class OnboardingViewController: UIViewController {
    
    private let onboardingView = OnboardingView()
    private let onboardingViewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onboardingViewModel.delegate = self
        self.setupView()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Setting buttons above keyboard when keyboard show up
    @objc func keyboardWillChange(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let keyboardHeight = view.frame.height - keyboardFrame.origin.y
        
        self.onboardingView.buttonBottomConstraint?.isActive = false
        self.onboardingView.buttonBottomConstraint = self.onboardingView.getBtForgetPassword().bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(keyboardHeight + 16))
        self.onboardingView.buttonBottomConstraint?.isActive = true
    }
    
    // MARK: Setting buttons on original location
    @objc func keyboardDidDisappear(notification: NSNotification) {
        self.onboardingView.buttonBottomConstraint?.isActive = false
        self.onboardingView.getConstraints()
    }
    
    private func setupView() {
        self.view = onboardingView
        self.onboardingView.actionRegister = self.clickedRegister
        self.onboardingView.loginAction = self.clickedLogin
        self.onboardingView.setupDelegate(delegate: self)
    }
    
    private func clickedRegister() {
        self.onboardingViewModel.doRegister()
    }
    
    private func clickedLogin() {
        self.onboardingViewModel.setLogin(email: self.onboardingView.getTfEmail().text ?? "", password: self.onboardingView.getTfPassword().text ?? "")
        self.onboardingViewModel.loginSuccess()
    }
    
    private func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok: UIAlertAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(ok)
        self.present(alertController, animated: true)
    }

}

extension OnboardingViewController: OnboardingViewModelDelegate {
    func registerOnSucessPush() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func loginOnSucessPush() {
        self.alert(title: onboardingViewModel.title, message: onboardingViewModel.message)
    }
}

extension OnboardingViewController: UITextFieldDelegate {
    
    // MARK: Jump to next Text Field when touch on "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == onboardingView.getTfEmail() {
            textField.resignFirstResponder()
            onboardingView.getTfPassword().becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

extension OnboardingViewController {
    
    // MARK: Setting close keyboard when touching out of text field
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
