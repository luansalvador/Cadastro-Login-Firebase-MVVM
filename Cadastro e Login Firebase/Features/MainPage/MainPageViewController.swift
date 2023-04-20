//
//  MainPageViewController.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 20/04/23.
//

import UIKit

class MainPageViewController: UIViewController {
    
    let mainPageView = MainPageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        self.view = mainPageView        
    }

}
