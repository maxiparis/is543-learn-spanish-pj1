//
//  PracticeViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/22/24.
//

import Foundation

@Observable class PracticeViewModel {
    var lessons: [Lesson]
    
    init(lessons: [Lesson]) {
        self.lessons = lessons
    }
}
