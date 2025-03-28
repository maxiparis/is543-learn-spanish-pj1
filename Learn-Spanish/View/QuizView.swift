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
    @Binding var isPresented: Bool
    
    //MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 15) {
                    //MARK: - Score and Questions Left
                    
                    HStack {
                        Text("Highest Score: \(quizVM.highestScore)")
                        Spacer()
                        Text("Score: \(quizVM.score)")
                        Spacer()
                        Text(quizVM.currentQuestionIsLastOne ? "This is the last question" : "Questions left: \(quizVM.questionsLeft)")
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
                            ProgressView(value: quizVM.secondsLeft, total: 20)
                                .progressViewStyle(.linear)
                            HStack {
                                if quizVM.secondsLeft == 0 {
                                    Text("You lost your time bonus")
                                }
                                Text("")
                                Spacer()
                                Text("\(Int(quizVM.secondsLeft))")
                            }
                        }
                        .padding()
                    }
                    
                    //MARK: - True/False Buttons
                    
                    HStack {
                        Group {
                            Button {
                                withAnimation {
                                    quizVM.answerQuestionWith(true)
                                }
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("True")
                                        .font(.title2)
                                        .frame( height: 40)
                                    Spacer()
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    quizVM.answerQuestionWith(false)
                                }
                            } label: {
                                HStack {
                                    Spacer()
                                    Text("False")
                                        .font(.title2)
                                        .frame( height: 40)
                                    Spacer()
                                }
                            }
                        }
                        .buttonStyle(.bordered)
                        .disabled(quizVM.currentQuestion.hasBeenAnswered)
                    }
                    
                    //MARK: - Correct / Incorrect Answer
                    
                    ZStack {
                        if let isAnswerCorrect = quizVM.currentQuestion.isAnswerCorrect {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(isAnswerCorrect ? Color.green : Color.red)
                                .frame(height: 80)
                            Text(isAnswerCorrect ? "Correct" : "Incorrect. In Spanish, it is \"\(quizVM.currentQuestion.wordInSpanish)\"")
                        }
                    }
                    .padding()
                    .opacity(quizVM.currentQuestion.hasBeenAnswered ? 1 : 0) //It will be hidden until the user answer
                    
                    //MARK: - Next Question
                    
                    Button {
                        withAnimation {
                            if quizVM.currentQuestionIsLastOne {
                                quizVM.endSession()
                                isPresented = false
                            } else {
                                quizVM.advanceQuestions()
                            }
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(quizVM.currentQuestionIsLastOne ? "Finish" : "Next Question").font(.title2)
                            Spacer()
                        }.frame(height: 40)
                    }
                    .buttonStyle(.borderedProminent)
                    .opacity(quizVM.currentQuestion.hasBeenAnswered ? 1 : 0)
                    .disabled(!quizVM.currentQuestion.hasBeenAnswered)
                }
                .padding()
            }
        }
        .onAppear {
            quizVM.startTimer()
        }
    }
}


//
//#Preview {
//    QuizView(quizVM: QuizViewModel(topic:
//                Topic(title: "Greetings", emoji: "👋", isShortLessonCompleted: false, lessonDescription: "Spanish greetings vary by formality.",
//                      lessons: [
//            Lesson(phraseInEnglish: "Hi", phraseInSpanish: "Hola"),
//            Lesson(phraseInEnglish: "Good morning", phraseInSpanish: "Buenos días"),
//            Lesson(phraseInEnglish: "Good evening", phraseInSpanish: "Buenas noches"),
//            Lesson(phraseInEnglish: "Good afternoon", phraseInSpanish: "Buenas tardes")
//        ])))
//}
