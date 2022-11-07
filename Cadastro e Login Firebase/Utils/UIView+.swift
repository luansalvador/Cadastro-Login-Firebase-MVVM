//
//  UIButton+.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 06/11/22.
//

import UIKit

extension UIView {
    
    func setupPrimaryGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.primaryColor.cgColor, UIColor.gradientDark.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = self.bounds
        self.backgroundColor = nil
        self.layer.insertSublayer(gradient, at: 0)
        self.clipsToBounds = true
    }
}
