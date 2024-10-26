//
//  QuizView.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/22/24.
//

import SwiftUI

struct QuizView: View {
    
    //MARK: - Variables
    @State var quizVM: QuizViewModel
    @State var showNextQuestion: Bool = false
    
    //MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 15) {
                //MARK: - Score and Questions Left

                HStack {
                    Text("Score: \(quizVM.score)")
                    Spacer()
                    Text("Questions left: \(quizVM.questionsLeft)")
                }
                
                //MARK: - Prompt card and timer

                VStack {
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue.opacity(0.5))
                        Text(quizVM.currentQuestionPrompt)
                            .padding(.horizontal, 30)
                            .multilineTextAlignment(.center)
                            .font(.title2)
                    }
                    .padding(.top, 25)
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.4)
                    
                    VStack(spacing: 10) {
                        ProgressView(value: 13, total: 20) //TODO
                            .progressViewStyle(.linear)
                        HStack {
                            Spacer()
                            Text("13")
                        }
                    }
                    .padding()
                }
                
                //MARK: - True/False Buttons

                HStack(spacing: 15) {
                    Group {
                        Button {
//                            quizVM.answerQuestionWith(true)
                            showNextQuestion.toggle()
                        } label: {
                            Text("True")
                                .font(.title2)
                                .frame(width: 100, height: 40)
                        }
                        
                        Button {
                            quizVM.answerQuestionWith(false)
                        } label: {
                            Text("False")
                                .font(.title2)
                                .frame(width: 100, height: 40)
                        }
                    }
                    .padding()
                    .buttonStyle(.bordered)
                    
                }
                
                //MARK: - Name of section

                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(quizVM.currentQuestion.isPromptCorrectAnswer ? Color.green : Color.red)
                    Text("Correct")
                }
                .padding()
//                .opacity(quizVM.currentQuestion.hasBeenAnswered ? 0 : 1)
                
                
                //MARK: - Next Questionk
                
                Button {
                    //TODO: go to next question
                    print("Next tapped!!")
                } label: {
                    HStack {
                        Spacer()
                        Text("Next Question").font(.title2)
                        Spacer()
                    }.frame(height: 40)
                }
                .buttonStyle(.borderedProminent)
                .opacity(showNextQuestion ? 1 : 0)
                .disabled(!showNextQuestion)
            }
            .padding()
        }
    }
}



#Preview {
    QuizView(quizVM: QuizViewModel(topic:
                Topic(title: "Greetings", emoji: "👋", isShortLessonCompleted: false, lessonDescription: "Spanish greetings vary by formality.",
                      lessons: [
            Lesson(phraseInEnglish: "Hi", phraseInSpanish: "Hola"),
            Lesson(phraseInEnglish: "Good morning", phraseInSpanish: "Buenos días"),
            Lesson(phraseInEnglish: "Good evening", phraseInSpanish: "Buenas noches"),
            Lesson(phraseInEnglish: "Good afternoon", phraseInSpanish: "Buenas tardes")
        ])))
}
