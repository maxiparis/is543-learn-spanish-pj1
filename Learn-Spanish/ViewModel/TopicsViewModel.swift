//
//  TopicsViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import Foundation

@Observable class TopicsViewModel {
    
    //MARK: - Variables

    private var model = TopicsData()

    public var topics: [Topic] {
        model.topics
    }
    
    //MARK: - User Intents
    
    func resaveDataToDefaults() {
        model.forceSavingData()
    }

    
}
