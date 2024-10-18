//
//  TopicsIntroViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/17/24.
//

import Foundation

@Observable class TopicIntroViewModel {
    
    //MARK: - Properties
    
    private var model: TopicIntroBrain
    
    var isCompleted: Bool {
        get {
            model.topic.isShortLessonCompleted
        }
        set {
            setShortLessonCompleted(newValue)
        }
    }
    
    var title: String {
        model.topic.title
    }
    
    var lessonDescription: String {
        model.topic.lessonDescription
    }
    
    //MARK: - Initializer

    init(topic: Topic) {
        self.model = TopicIntroBrain(topic: topic)
    }
    
    //MARK: - User Intents
    
    func setShortLessonCompleted(_ isCompleted: Bool) {
        model.setShortLessonCompleted(isCompleted)
    }
    
    //MARK: - Helpers

}
