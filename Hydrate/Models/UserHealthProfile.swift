//
//  UserHealthProfile.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/19/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import HealthKit


class UserHealthProfile {
    
  
    var weight: Double?
//  var bodyMassIndex: Double?
    
    
    var waterIntakeRecommended: Double? {
        guard let weight = weight
        else {
              return nil
        }
      
        return (weight/2.0)
    }
    
    
}
