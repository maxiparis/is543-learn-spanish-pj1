//
//  TopicIntroBrain.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/17/24.
//

import Foundation

struct TopicIntroBrain {
    
    //MARK: - Varibles

    var topic: Topic
    var persistenceManager = PersistenceManager.shared
    
    //MARK: - Data Access
    
    
    //MARK: - Business Logic
    
    mutating func setShortLessonCompleted(_ isCompleted: Bool) {
        topic.isShortLessonCompleted = isCompleted
        persistenceManager.updateTopic(topic)
    }
    
    mutating func setPracticeCompleted(_ isCompleted: Bool) {
        topic.isPracticeCompleted = isCompleted
        persistenceManager.updateTopic(topic)
    }

    
}
