//
//  ActivityQuestion.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/18/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton

class ActivityQuestion: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        headerLabel.text = "How active are you?"
        headerLabel.textColor = .black
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    let superActiveBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "high"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("High", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let moderateBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "moderate"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("Moderate", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    let lazyBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "lazy"), for: .normal)
        button.setTitle("Low", for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.backgroundColor = .clear
        button.setTitle("Submit", for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    
    let submitButton: TransitionButton = {
        let button = TransitionButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        button.backgroundColor = UIColor(red:0.00, green:0.46, blue:0.60, alpha:1.0)
        button.setTitle("SUBMIT", for: .normal)
        button.cornerRadius = 20
        button.spinnerColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.titleLabel!.font = UIFont(name: "Helvetica-Bold", size: 13)
        button.semanticContentAttribute = .forceRightToLeft
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        
        
        return button
    }()
    
    
    func setup(){
        addSubview(stackView)
        stackView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView .centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(lazyBtn)
        stackView.addArrangedSubview(moderateBtn)
        stackView.addArrangedSubview(superActiveBtn)
        
        addSubview(headerLabel)
        
        headerLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.80).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
//        maleBtn.addTarget(self, action: #selector(maleTapped), for: .touchDown)
//        femaleBtn.addTarget(self, action: #selector(femaleTapped), for: .touchDown)
        
        
        

        addSubview(submitButton)
        
        submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30.0).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 90.0).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
