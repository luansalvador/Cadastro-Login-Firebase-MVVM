//
//  ShowBooksViewController.swift
//  Cadastro e Login Firebase
//
//  Created by Luan Henrique Salvador Amorim on 20/04/23.
//

import UIKit

class ShowBooksViewController: UIViewController {
    
    let showBooksView = ShowBooksView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meus Livros"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))
        configureView()
    }
    
    private func configureView() {
        self.view = showBooksView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc private func addTapped() {
        
    }

}
