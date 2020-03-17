//
//  LoginViewController.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/16/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import TransitionButton

class LoginViewController: UIViewController{
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    
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
        self.view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        
        let passwordTextField = CustomAnimatedTextField(placeholderText: "Password", floatedText: "Enter Password", selectedColor: UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0), icon: UIImage(systemName: "lock.fill")!, secure: true)
        
        let usernameTextField = CustomAnimatedTextField(placeholderText: "Username", floatedText: "Enter Username", selectedColor: UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0), icon: UIImage(systemName: "person.fill")!, secure: false)
        
        self.stackView.addArrangedSubview(usernameTextField)
        self.stackView.addArrangedSubview(passwordTextField)
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    }

}

