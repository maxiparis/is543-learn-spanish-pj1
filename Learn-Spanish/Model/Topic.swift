//
//  Topic.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/17/24.
//

import Foundation

struct Topic: Identifiable, Codable {

    var id: UUID = UUID()
    var title: String
    var emoji: String
    var isShortLessonCompleted: Bool
    var lessonDescription: String
    var lessons: [Lesson]
    
    struct Lesson: Identifiable, Codable {
        var id: UUID = UUID()
        let phraseInEnglish: String
        let phraseInSpanish: String
    }
}
