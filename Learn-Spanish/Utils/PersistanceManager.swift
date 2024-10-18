//
//  PersistanceManager.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/17/24.
//

import Foundation

class PersistenceManager {
    
    struct Keys {
        let topicsArray = "topicsArrayKey"
        let hasDataBeenSaved = "hasDataBeenSavedKey" // helpful to know when to load or save data.
    }
    
    // MARK: - Variables
    
    static let shared = PersistenceManager()
    
    private var defaults = UserDefaults.standard
    private var keys = Keys()
    
    // MARK: - Private initializer
    
    private init() { }

    // MARK: - Data Access/Persistance
    
    func saveTopicsArray(_ topics: [Topic]) {
        if let encodedData = try? JSONEncoder().encode(topics) {
            defaults.set(encodedData, forKey: keys.topicsArray)
        }
    }
    
    func loadTopicsArray() -> [Topic]? {
        if let topicsData = defaults.data(forKey: keys.topicsArray),
           let decodedTopics = try? JSONDecoder().decode([Topic].self, from: topicsData) {
            return decodedTopics
        }
        return nil
    }
    
    func hasDataBeenLoaded() -> Bool {
        defaults.bool(forKey: keys.hasDataBeenSaved)
    }
    
    func setHasDataBeenLoaded() {
        defaults.set(true, forKey: keys.hasDataBeenSaved)
    }
    
}

