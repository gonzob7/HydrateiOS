//
//  CustomPasswordField.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/17/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class CustomPasswordField: UITextField{
    
    let showButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("SHOW", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = true
        textfield.font = UIFont(name: "Helvetica-Bold", size: 18)
        textfield.textColor = UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0)
        textfield.rightViewMode = .unlessEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        passwordTextfield.rightView = showButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
