//
//  TopicIntroView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import SwiftUI

struct TopicIntroView: View {
    var topic: Topic
    @State private var isCompleted: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Short Lesson")
                .font(.title3)
                .fontWeight(.bold)
            )
            {
                Text("\(topic.lessonDescription)")
                Toggle(isOn: $isCompleted) {
                    Text("I've completed this lesson")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
            }
        }
        .navigationTitle(topic.title)
    }
}

#Preview {
    TopicIntroView(topic: Topic(title: "Hobbies", emoji: "🎸", isCompleted: false, lessonDescription: "Learn to talk about your hobbies in Spanish. Words like 'Leer' (Reading), 'Cantar' (Singing), and 'Correr' (Running) will help you share your favorite pastimes."))
}
