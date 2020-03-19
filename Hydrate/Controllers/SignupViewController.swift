//
//  SignupViewController.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/17/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton

class SignupViewController: UIViewController{

        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .equalSpacing
            return stackView
        }()
        
        let logo: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFit
            image.image = UIImage(named: "hydrateLogo")
            return image
        }()
        
        let backTosignUpButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0)
            button.titleLabel?.font = UIFont(name: "Helvetica-Light", size: 18)
            button.setTitle("Already have an account? Sign in now!", for: .normal)
            return button
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
            stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true

            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            stackView .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            


            
            let passwordTextField = CustomAnimatedTextField(placeholderText: "Password", floatedText: "Enter Password", selectedColor: UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0), icon: UIImage(systemName: "lock.fill")!, secure: true)
            
            let usernameTextField = CustomAnimatedTextField(placeholderText: "Username", floatedText: "Enter Username", selectedColor: UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0), icon: UIImage(systemName: "person.fill")!, secure: false)
            
            let emailTextField = CustomAnimatedTextField(placeholderText: "Email", floatedText: "Enter Email", selectedColor: UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0), icon: UIImage(systemName: "envelope.fill")!, secure: false)
            
            self.stackView.addArrangedSubview(usernameTextField)
            self.stackView.addArrangedSubview(emailTextField)
            self.stackView.addArrangedSubview(passwordTextField)
            
            usernameTextField.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            
            let signUpButton = TransitionButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
            signUpButton.backgroundColor = UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0)
            signUpButton.setTitle("CREATE ACCOUNT", for: .normal)
            signUpButton.cornerRadius = 20
            signUpButton.spinnerColor = .white
            signUpButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
            
            self.view.addSubview(signUpButton)
            
            signUpButton.translatesAutoresizingMaskIntoConstraints = false
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30.0).isActive = true
            signUpButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            signUpButton.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            signUpButton.tintColor = .white
            signUpButton.titleLabel!.font = UIFont(name: "Helvetica-Bold", size: 13)
            signUpButton.semanticContentAttribute = .forceRightToLeft
            signUpButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            
            
            self.view.addSubview(logo)
            logo.translatesAutoresizingMaskIntoConstraints = false
            logo.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -100).isActive = true
            logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            logo.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            
            
            self.view.addSubview(backTosignUpButton)
            backTosignUpButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            backTosignUpButton.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            backTosignUpButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
            backTosignUpButton.addTarget(self, action: #selector(logInSegue), for: .touchUpInside)
        }
    
    
    @objc func logInSegue(_ sender: UIButton){
        let logInVC = LoginViewController()
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    
    
        
        
        @objc func loginTapped(_ sender: TransitionButton){
            sender.startAnimation() // 2: Then start the animation when the user tap the button
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(2) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    sender.stopAnimation(animationStyle: .normal, revertAfterDelay: 0.10, completion: {
                        let buildVC = ProfileBuilderViewController()
                        self.navigationController?.pushViewController(buildVC, animated: true)
//                        self.present(buildVC, animated: true, completion: nil)
                    })
                })
            })
        }

}
