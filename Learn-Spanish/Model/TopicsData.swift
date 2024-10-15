//
//  TopicsData.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import Foundation

struct TopicsData {
    var topics: [Topic]
    
    init() {
        topics = [
            Topic(title: "Basic", emoji: "⭐️", isCompleted: false),
            Topic(title: "Common Pharses", emoji: "🗣️", isCompleted: false)
        ]
    }
    
}

struct Topic: Identifiable {
    var id: UUID = UUID()
    var title: String
    var emoji: String
    var isCompleted: Bool
}
