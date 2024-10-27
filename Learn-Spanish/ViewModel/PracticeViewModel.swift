//
//  PracticeViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/22/24.
//

import Foundation

@Observable class PracticeViewModel {
    
    //MARK: - Properties

    var lessons: [Lesson]
    var selectedLesson = 0

    //MARK: - Init

    init(lessons: [Lesson]) {
        self.lessons = lessons.shuffled()
    }
    
    //MARK: - User Intents
    
    func navigatePrevCard() {
        selectedLesson = max(selectedLesson - 1, 0)
    }
    
    func navigateNextCard() {
        selectedLesson = min(selectedLesson + 1, lessons.count - 1)
    }

    
    
}
