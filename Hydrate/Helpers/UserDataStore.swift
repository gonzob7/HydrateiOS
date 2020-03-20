//
//  UserDataStore.swift
//  Hydrate
//
//  Created by Gonzalo Birrueta on 3/19/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import HealthKit

class UserDataStore{
    
    class func getWeight() throws -> (HKObjectType) {
        
      let healthKitStore = HKHealthStore()
        
      do {

        //1. This method throws an error if these data are not available.

        let weightAmount = HKObjectType.quantityType(forIdentifier: .bodyMass)

          
        //2. Use Calendar to calculate age.
         
        //3. Unwrap the wrappers to get the underlying enum values.
        let unwrappedWeight = weightAmount
          
        return (unwrappedWeight!)
      }
    }
    
    
    class func getMostRecentSample(for sampleType: HKSampleType,
                                   completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {
      
    //1. Use HKQuery to load the most recent samples.
    let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                          end: Date(),
                                                          options: .strictEndDate)
        
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                          ascending: false)
        
    let limit = 1
        
    let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                    predicate: mostRecentPredicate,
                                    limit: limit,
                                    sortDescriptors: [sortDescriptor]) { (query, samples, error) in
        
        //2. Always dispatch to the main thread when complete.
        DispatchQueue.main.async {
            
          guard let samples = samples,
                let mostRecentSample = samples.first as? HKQuantitySample else {
                    
                completion(nil, error)
                return
          }
            
          completion(mostRecentSample, nil)
        }
      }
     
    HKHealthStore().execute(sampleQuery)
    }
    
    
    
}
