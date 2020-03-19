//
//  HealthKitPermissionsView.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/18/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import HealthKit

class HealthKitPermissionsView: UIView{
    
    let healthKitStore:HKHealthStore = HKHealthStore()
    
    
    let allowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 15)
        button.backgroundColor = .clear
        button.setTitle("Allow Healthkit Permissions", for: .normal)
//        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
//        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    func setup(){
    
        addSubview(allowButton)
        allowButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        allowButton.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        allowButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        allowButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        
        allowButton.addTarget(self, action: #selector(allowPressed), for: .touchUpInside)
    }
    
    @objc func allowPressed(){
        print("allow pressed")
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func authorizeHealthKit(){
        
        let healthKitTypesToRead: Set<HKObjectType> = [
            
            HKObjectType.characteristicType(forIdentifier: .biologicalSex)!,
            HKObjectType.characteristicType(forIdentifier: .biologicalSex)!
        
        ]
        
        let healthKitTypesToWrite: Set<HKSampleType> = []
        
        if !HKHealthStore.isHealthDataAvailable(){
            print("error")
            return
        }
        
        
        healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (succer, error) in
            print("Authorization Succeeded")
        }
        
    }
    
}