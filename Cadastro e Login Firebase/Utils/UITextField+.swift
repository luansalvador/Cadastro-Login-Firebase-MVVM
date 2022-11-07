//
//  UITextField+.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 06/11/22.
//

import UIKit

extension UITextField {
    
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 0.5)
        bottomLine.backgroundColor = UIColor.primaryColor.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
}
