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
            Topic(title: "Common Phrases", emoji: "🗣️", isCompleted: false),
            Topic(title: "Numbers", emoji: "1️⃣", isCompleted: false),
            Topic(title: "Greetings", emoji: "👋", isCompleted: false),
            Topic(title: "Colors", emoji: "🎨", isCompleted: false),
            Topic(title: "Family", emoji: "👨‍👩‍👧", isCompleted: false),
            Topic(title: "Food & Drink", emoji: "🍎", isCompleted: false),
            Topic(title: "Travel", emoji: "✈️", isCompleted: false),
            Topic(title: "Time & Dates", emoji: "⏰", isCompleted: false),
            Topic(title: "Shopping", emoji: "🛒", isCompleted: false),
            Topic(title: "Directions", emoji: "🧭", isCompleted: false),
            Topic(title: "Weather", emoji: "☀️", isCompleted: false),
            Topic(title: "Occupations", emoji: "💼", isCompleted: false),
            Topic(title: "Clothing", emoji: "👗", isCompleted: false),
            Topic(title: "Animals", emoji: "🐶", isCompleted: false),
            Topic(title: "Health", emoji: "💊", isCompleted: false),
            Topic(title: "Emotions", emoji: "😊", isCompleted: false),
            Topic(title: "Hobbies", emoji: "🎸", isCompleted: false),
            Topic(title: "Sports", emoji: "⚽️", isCompleted: false),
            Topic(title: "Technology", emoji: "💻", isCompleted: false),
            Topic(title: "School", emoji: "🏫", isCompleted: false)
        ]
    }
}

struct Topic: Identifiable {
    var id: UUID = UUID()
    var title: String
    var emoji: String
    var isCompleted: Bool
}
