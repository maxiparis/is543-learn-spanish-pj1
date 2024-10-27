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
    
    var topic: Topic {
        model.topic
    }
    var isLessonCompleted: Bool {
        get {
            model.topic.isShortLessonCompleted
        }
        set {
            setShortLessonCompleted(newValue)
        }
    }
    var isPracticeCompleted: Bool {
        get {
            model.topic.isPracticeCompleted
        }
        set {
            setPracticeCompleted(newValue)
        }
    }
    
    var title: String {
        model.topic.title
    }
    
    var lessonDescription: String {
        model.topic.lessonDescription
    }
    
    var lessons: [Lesson] {
        model.topic.lessons
    }
    
    //MARK: - Initializer

    init(topic: Topic) {
        self.model = TopicIntroBrain(topic: topic)
    }
    
    //MARK: - User Intents
    
    func setShortLessonCompleted(_ isCompleted: Bool) {
        model.setShortLessonCompleted(isCompleted)
    }
    
    func setPracticeCompleted(_ isCompleted: Bool) {
        model.setPracticeCompleted(isCompleted)
    }
    
    //MARK: - Helpers
    
    func loadTopic() {
        model.loadTopicWithId(topic.id)
    }
}
