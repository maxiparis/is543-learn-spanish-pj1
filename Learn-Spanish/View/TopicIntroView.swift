//
//  TopicIntroView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/15/24.
//

import SwiftUI

struct TopicIntroView: View {
    
    @State var topicIntroVM : TopicIntroViewModel
    
    //MARK: - Body view

    var body: some View {
        Form {
            shortLesson
            startPracticeButton
            startQuizButton
            wordsList
        }
        .navigationTitle(topicIntroVM.title)
    }
    
    //MARK: - Short Lesson View
    
    var shortLesson: some View {
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
    
    //MARK: - Start Practice View
    
    var startPracticeButton: some View {
        Section(header: Text("Practice makes perfect")) {
            Button {
                //TODO
                print("Start Practice tapped.")
            } label: {
                Label("Start Practice", systemImage: "book")
            }
        }
    }
    
    //MARK: - Start Quiz View
    
    var startQuizButton: some View {
        Section(header: Text("Are you ready for a challenge?")) {
            Button {
                //TODO
                print("Start Quiz tapped.")
            } label: {
                Label("Start Quiz", systemImage: "applepencil.and.scribble")
            }
        }
    }
    
    //MARK: - List of words view
    
    var wordsList: some View {
        Section(header: Text("List of Words")) {
            List(topicIntroVM.lessons) { lesson in
                HStack {
                    Text(lesson.phraseInEnglish)
                    Spacer()
                    Text(lesson.phraseInSpanish)
                }
            }
        }
    }
}

#Preview {
    TopicIntroView(
        topicIntroVM: TopicIntroViewModel(
            topic:
                Topic(title: "Basic", emoji: "⭐️", isShortLessonCompleted: false, lessonDescription: "Start with the basics! In Spanish, 'Hola' means 'Hello,' and 'Adiós' means 'Goodbye.'",
                      lessons: [
                        Topic.Lesson(phraseInEnglish: "Hello", phraseInSpanish: "Hola"),
                        Topic.Lesson(phraseInEnglish: "Goodbye", phraseInSpanish: "Adiós"),
                        Topic.Lesson(phraseInEnglish: "Yes", phraseInSpanish: "Sí"),
                        Topic.Lesson(phraseInEnglish: "No", phraseInSpanish: "No")
                      ])
        )
    )
}
