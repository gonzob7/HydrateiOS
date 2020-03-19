//
//  GenderQuestion.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/18/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class GenderQuestion: UIView{
    
    var maleSelected = false
    var femaleSelected = false
    
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
        headerLabel.text = "What is your sex?"
        headerLabel.textColor = .black
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        return headerLabel
    }()
    
    let maleBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "boy"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit

        return button
    }()
    
    let femaleBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "girl"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 20)
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    
    func setup(){
        addSubview(stackView)
        stackView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView .centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(femaleBtn)
        stackView.addArrangedSubview(maleBtn)
        
        addSubview(headerLabel)
        
        headerLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.80).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        maleBtn.addTarget(self, action: #selector(maleTapped), for: .touchDown)
        femaleBtn.addTarget(self, action: #selector(femaleTapped), for: .touchDown)
        
        
        addSubview(continueButton)
        continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        
        
    }
    
    @objc func maleTapped(_ sender: UIButton){
        if femaleSelected == true{
            femaleBtn.backgroundColor = .clear
            femaleSelected = false
            maleBtn.backgroundColor = .blue
            maleSelected = true
        }else{
            maleBtn.backgroundColor = .blue
            maleSelected = true
        }
    }
    
    @objc func femaleTapped(_ sender: UIButton){
        if maleSelected == true{
            maleBtn.backgroundColor = .clear
            maleSelected = false
            femaleBtn.backgroundColor = .systemPink
            femaleSelected = true
        }else{
            femaleBtn.backgroundColor = .systemPink
            femaleSelected = true
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
