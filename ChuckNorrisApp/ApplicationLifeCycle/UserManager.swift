//
//  UserManager.swift
//  ChuckNorrisApp
//
//  Created by Mehmet Barkın Mercan on 11.07.2024.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    fileprivate let userDefaults = UserDefaults()
    
    var lastSavedFactID: String? {
        get {
            guard let factID = userDefaults.string(forKey: "fact_ID") else {
                return nil
            }
            return factID
        }
        set {
            userDefaults.set(newValue, forKey: "fact_ID")
            userDefaults.synchronize()
        }
    }
}
