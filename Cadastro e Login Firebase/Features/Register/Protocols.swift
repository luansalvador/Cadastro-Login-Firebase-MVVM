//
//  Protocols.swift
//  Cadastro e Login Firebase
//
//  Created by Hst on 16/10/22.
//

import Foundation
import UIKit

protocol ConfigurableCellProtocol {
    func configureCell(text: String?,
                       tag: Int,
                       parent: UITextFieldDelegate?)
}
