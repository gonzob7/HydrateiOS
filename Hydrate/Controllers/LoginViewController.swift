//
//  LoginViewController.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/16/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupView()
    }
    
    func setupNav(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupView(){
        self.view.backgroundColor = .white
        
        let passwordTextField = CustomAnimatedTextField(placeholderText: "Password", floatedText: "Enter Password", selectedColor: UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0), icon: UIImage(systemName: "lock.fill")!, secure: true)
        
        
        self.view.addSubview(passwordTextField)
        
        passwordTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    }

}

