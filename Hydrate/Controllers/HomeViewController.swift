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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
        loadAndDisplayWeight()
    }
    
    
    func setupViews(){
//        print(weight)
    }
    
    
    func updateLabels(){
        
        print("\(userHealthProfile.waterIntakeRecommended!)oz recommended")
        logWaterToHealthKit()
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
          UserDataStore.saveWaterSample(waterAmount: 10, date: Date())
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
    
    
    

    
    
//    func readWeight(){
//
//        let weightType = HKSampleType.quantityType(forIdentifier: .bodyMass)!
//
//        let query = HKSampleQuery(sampleType: weightType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, results, error) in
//            if let result = results?.last as? HKQuantitySample{
//                print("Weight: \(result.quantity)")
//                DispatchQueue.main.async(execute: { () -> Void in
//                    self.weight = result.quantity.doubleValue(for: Double(HKUnit))
//
//                });
//            }else{
//                print("error")
//
//            }
//        }
//
//    }
    
    
}
