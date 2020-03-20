//
//  HomeViewController.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/17/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import TransitionButton
import HealthKit

class HomeViewController: CustomTransitionViewController{
    
    
    private let userHealthProfile = UserHealthProfile()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let logAmount: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        label.text = "0oz"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let goalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 15)
        label.text = ""
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let logSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.setValue(5, animated: false)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let logButton: TransitionButton = {
        let button = TransitionButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        button.backgroundColor = .blue
        button.setTitle("LOG", for: .normal)
        button.cornerRadius = 20
        button.spinnerColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.titleLabel!.font = UIFont(name: "Helvetica-Bold", size: 13)
        button.semanticContentAttribute = .forceRightToLeft
        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        

        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
        loadAndDisplayWeight()

    }
    
    
    
    func setupViews(){
    
        self.view.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(goalLabel)
        
        stackView.addArrangedSubview(logAmount)
        
        stackView.addArrangedSubview(logSlider)
        
        stackView.addArrangedSubview(logButton)
        logButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        
        logButton.addTarget(self, action: #selector(logButtonTapped), for: .touchUpInside)
        logSlider.addTarget(self, action: #selector(stepper), for: .valueChanged)
    }
    
    
    func updateLabels(){
        goalLabel.text = "\(userHealthProfile.waterIntakeRecommended!)oz recommended per day"
    }
    
    @objc func logButtonTapped(){
        logWaterToHealthKit()
    }
    
    @objc func stepper(_ sender: UISlider){
        let step: Float = 1
        let currentValue = round((sender.value - sender.minimumValue) / step)
        let ozAmount = Int(currentValue)
        sender.value = currentValue
        
        logAmount.text = "Log \(ozAmount)oz"

    }

    
    private func loadAndDisplayWeight() {
        
        guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
          print("Body Mass Sample Type is no longer available in HealthKit")
          return
        }
        
        UserDataStore.getMostRecentSample(for: weightSampleType) { (sample, error) in
              
          guard let sample = sample else {
              
            if let error = error {
              self.displayAlert(for: error)
            }
                
            return
          }
              
            let weightInPounds = sample.quantity.doubleValue(for: HKUnit.pound())
            self.userHealthProfile.weight = weightInPounds
            self.updateLabels()
        }
        
        
    }
    
    
    private func logWaterToHealthKit() {
        UserDataStore.saveWaterSample(waterAmount: Double(self.logSlider.value), date: Date())
        print("Logged \(Double(self.logSlider.value))oz of water! Check HK")
    }
    
    
    private func displayAlert(for error: Error) {
      
      let alert = UIAlertController(title: nil,
                                    message: error.localizedDescription,
                                    preferredStyle: .alert)
      
      alert.addAction(UIAlertAction(title: "O.K.",
                                    style: .default,
                                    handler: nil))
      
      present(alert, animated: true, completion: nil)
    }
    
    
}
