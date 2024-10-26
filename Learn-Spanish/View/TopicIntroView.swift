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
            Toggle(isOn: $topicIntroVM.isLessonCompleted) {
                Text("I've read this lesson")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    //MARK: - Start Practice View
    
    var startPracticeButton: some View {
        Section(header: Text("Practice makes perfect")) {
            NavigationLink {
                PracticeView(practiceVM: PracticeViewModel(lessons: topicIntroVM.lessons))
            } label: {
                Label("Start Practice", systemImage: "book")
            }
            
            Toggle(isOn: $topicIntroVM.isPracticeCompleted) {
                Text("Completed the practice")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    //MARK: - Start Quiz View
    
    var startQuizButton: some View {
        Section(header: Text("Are you ready for a challenge?")) {
            NavigationLink {
                QuizView(quizVM: QuizViewModel(topic: topicIntroVM.topic))
            } label: {
                Label("Start Quiz", systemImage: "applepencil.and.scribble")
            }
            
            HStack {
                Text("Progress")
                Spacer()
                Text("[30%]")
                    .foregroundStyle(.secondary)
                //TODO: progress
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
                Topic(title: "Basic", emoji: "⭐️", isShortLessonCompleted: false, isPracticeCompleted: false, lessonDescription: "Start with the basics! In Spanish, 'Hola' means 'Hello,' and 'Adiós' means 'Goodbye.'",
                      lessons: [
                        Lesson(phraseInEnglish: "Hello", phraseInSpanish: "Hola"),
                        Lesson(phraseInEnglish: "Goodbye", phraseInSpanish: "Adiós"),
                        Lesson(phraseInEnglish: "Yes", phraseInSpanish: "Sí"),
                        Lesson(phraseInEnglish: "No", phraseInSpanish: "No")
                      ])
        )
    )
}
