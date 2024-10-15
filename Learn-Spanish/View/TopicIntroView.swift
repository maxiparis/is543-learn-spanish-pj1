//
//  TopicIntroView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import SwiftUI

struct TopicIntroView: View {
    var topic: Topic
    
    var body: some View {
        VStack {
            Spacer()
            Text("Short Lesson")
                .font(.title)
            Text("\(topic.lessonDescription)")
                .padding()
            Spacer()
        }.navigationTitle(topic.title)
    }
}

#Preview {
    TopicIntroView(topic: Topic(title: "Hobbies", emoji: "🎸", isCompleted: false, lessonDescription: "Learn to talk about your hobbies in Spanish. Words like 'Leer' (Reading), 'Cantar' (Singing), and 'Correr' (Running) will help you share your favorite pastimes."))
}
