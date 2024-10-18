//
//  Topic.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/17/24.
//

import Foundation

struct Topic: Identifiable, Encodable, Decodable {

    var id: UUID = UUID()
    var title: String
    var emoji: String
    var isShortLessonCompleted: Bool
    var lessonDescription: String
}
