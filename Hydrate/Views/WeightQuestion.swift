//
//  WeightQuestion.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/18/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit
import HealthKit
import TransitionButton

class WeightQuestion: UIView, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var weight = (100...400).map { String($0) }
    let healthKitStore:HKHealthStore = HKHealthStore()

    
    
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
        

        addSubview(submitButton)
        
        submitButton.topAnchor.constraint(equalTo: weightPicker.bottomAnchor, constant: 30.0).isActive = true
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

        let valueSelected = Double(weight[row])
        let today = NSDate()
        
        
        
        if let type = HKSampleType.quantityType(forIdentifier: .bodyMass){
            
            let quantity = HKQuantity(unit: HKUnit.pound(), doubleValue: Double(valueSelected!))
            
            let sample = HKQuantitySample(type: type, quantity: quantity, start: today as Date, end: today as Date)
            healthKitStore.save(sample) { (success, error) in
                print("Saved \(success), error \(error)")
            }
            
        }
        
        
        
    }
    
}
