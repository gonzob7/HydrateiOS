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
    

    
    let passwordTextfield: SkyFloatingLabelTextField = {
        let textfield = SkyFloatingLabelTextFieldWithIcon(frame: CGRect(x: 150, y: 10, width: 120, height: 45), iconType: .image)
//        var button = UIButton(type: .custom)
        let selectedColor = UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0)
        
        
        textfield.isSecureTextEntry = true
        textfield.placeholder = "Password"
        textfield.placeholderFont = UIFont(name: "Helvetica", size: 18)
        textfield.title = "Password"
        textfield.font = UIFont(name: "Helvetica-Bold", size: 18)
        textfield.textColor = selectedColor
        textfield.selectedTitleColor = selectedColor
        textfield.selectedLineColor = selectedColor
        textfield.iconImage = UIImage(systemName: "lock.fill")
        textfield.selectedIconColor = selectedColor
        textfield.tintColor = selectedColor
        textfield.rightViewMode = .always

        textfield.translatesAutoresizingMaskIntoConstraints = false


//        textfield.rightView = button
//

//
//        button.setImage(UIImage(systemName: "eye"), for: .normal)
//        button.imageView?.frame = CGRect(x: 0, y: 0, width: button.frame.size.width , height: button.frame.size.height - 30.0)
//
//        button.setTitleColor(UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0), for: .normal)
//        button.addTarget(self, action: #selector(showTapped), for: .touchUpInside)
//
//        button.translatesAutoresizingMaskIntoConstraints = true
//
        
        return textfield
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
        
        self.view.addSubview(passwordTextfield)
        passwordTextfield.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passwordTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextfield.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
    }
    
    
//    @objc func showTapped(_ sender: UIButton){
//        if self.passwordTextfield.isSecureTextEntry == false{
//            self.passwordTextfield.isSecureTextEntry = true
//            sender.setImage(UIImage(systemName: "eye"), for: .normal)
//        }else{
//            self.passwordTextfield.isSecureTextEntry = false
//            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
//        }
//
//    }

}

extension NSLayoutDimension {

@discardableResult
func set(
        to constant: CGFloat,
        priority: UILayoutPriority = .required
        ) -> NSLayoutConstraint {

        let cons = constraint(equalToConstant: constant)
        cons.priority = priority
        cons.isActive = true
        return cons
    }
}
