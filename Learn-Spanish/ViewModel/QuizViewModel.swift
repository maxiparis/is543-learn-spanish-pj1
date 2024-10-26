//
//  QuizViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/25/24.
//

import Foundation
import SwiftUI

@Observable class QuizViewModel {
    
    //MARK: - Variables

    var model: QuizSession
    var timer = Timer()
    var questions: [QuizQuestion] { model.questions }
    var currentQuestion: QuizQuestion { model.currentQuestion }
    var score: Int { model.score }
    var questionsLeft: Int { model.questionsLeft } //TODO: maybe the vm can keep track of this instead of the model
    var currentQuestionPrompt: String {
        //TODO: maybe add more options
        return """
        True or False: The Spanish word for \"\(currentQuestion.wordInEnglish)\" is \"\(currentQuestion.prompt)\"?
        """
    }
    var secondsLeft: TimeInterval = 20 {
        didSet {
            if secondsLeft == 0 {
                stopTimer()
            }
        }
    }
    var currentQuestionIsLastOne: Bool { model.currentQuestionIsLastOne }
    
    //MARK: - Init
    
    init(topic: Topic) {
        self.model = QuizSession(topic: topic)
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func startTimer() {
        timer.invalidate()
        secondsLeft = 20
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            withAnimation(.linear) {
                self.secondsLeft -= 1
            }
        })
    }

    //MARK: - User Intents
    
    func answerQuestionWith(_ answer: Bool) {
        stopTimer()
        model.validateAnswer(answer, seconds: secondsLeft)
    }
    
    func advanceQuestions() {
        model.advanceCurrentQuestionIndex()
        startTimer()
    }
    
    func endSession() {
        //persist: higher score
        //persist: if completed or not
        model.endSession()
    }
}
