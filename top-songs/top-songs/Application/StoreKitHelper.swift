//
//  StoreKitHelper.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation
import StoreKit

struct StoreKitHelper {
    
    static private let numberOfTimesLanchedKey = "numberOfTimesLanched"
    static private let numberOfTimesToDisplayAgain = 10
    static private var numberOfTimesLaunched: Int {
        UserDefaults.standard.integer(forKey: numberOfTimesLanchedKey)
    }
    
    static func displayStoreKit() {
        if numberOfTimesLaunched >= numberOfTimesToDisplayAgain {
            SKStoreReviewController.requestReview()
            UserDefaults.standard.set(0, forKey: numberOfTimesLanchedKey)
        }
    }
    
    static func incrementNumberOfTimesLaunched() {
        UserDefaults.standard.set(numberOfTimesLaunched + 1, forKey: numberOfTimesLanchedKey)
    }
    
}
