//
//  LoginViewController.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/16/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit

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
    }
}
