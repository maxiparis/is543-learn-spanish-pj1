//
//  TopicIntroView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import SwiftUI

struct TopicIntroView: View {
    
    @State var topicIntroVM : TopicIntroViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Short Lesson")
                .font(.title3)
                .fontWeight(.bold)
            )
            {
                Text("\(topicIntroVM.lessonDescription)")
                Toggle(isOn: $topicIntroVM.isCompleted) {
                    Text("I've completed this lesson")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
            }
        }
        .navigationTitle(topicIntroVM.title)
    }
}

#Preview {
    TopicIntroView(
        topicIntroVM: TopicIntroViewModel(
            topic:
                Topic(
                    title: "Hobbies",
                    emoji: "🎸",
                    isShortLessonCompleted: false,
                    lessonDescription: "Learn to talk about your hobbies in Spanish. Words like 'Leer' (Reading), 'Cantar' (Singing), and 'Correr' (Running) will help you share your favorite pastimes."
                )
        )
    )
}
