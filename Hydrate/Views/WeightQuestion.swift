//
//  WeightQuestion.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/18/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class WeightQuestion: UIView, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var weight = (100...400).map { String($0) }

    let weightPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
        headerLabel.text = "What is your weight?"
        headerLabel.textColor = .black
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        return headerLabel
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
        addSubview(weightPicker)
        weightPicker.delegate = self
        weightPicker.dataSource = self
        
        weightPicker.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        weightPicker.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
        weightPicker.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive
         = true
        weightPicker.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive
         = true
        
        
        addSubview(headerLabel)
        
        headerLabel.bottomAnchor.constraint(equalTo: weightPicker.topAnchor, constant: -20).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.80).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        addSubview(continueButton)
        continueButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return weight.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = weight[row] + "lbs"
       return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

           let valueSelected = Int(weight[row])
    }
    
}
