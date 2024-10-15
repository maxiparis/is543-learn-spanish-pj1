//
//  TopicsViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import Foundation

@Observable class TopicsViewModel {
    //reference to the model
    private let model = TopicsData()
    
    public var topics: [Topic] {
        model.topics
    }
    
}
