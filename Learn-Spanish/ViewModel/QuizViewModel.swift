//
//  QuizViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/25/24.
//

import Foundation
import AVFoundation
import SwiftUI

@Observable class QuizViewModel {
    
    //MARK: - Variables

    var model: QuizSession
    var timer = Timer()
    var questions: [QuizQuestion] { model.questions }
    var currentQuestion: QuizQuestion { model.currentQuestion }
    var score: Int { model.score }
    var questionsLeft: Int { model.questionsLeft }
    var currentQuestionPrompt: String {
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
    var audioPlayer = AVAudioPlayer()
    
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
        let answerWasCorrect = model.validateAnswer(answer, seconds: secondsLeft)
        if let answerWasCorrect {
            playSoundFor(answerWasCorrect)            
        }
    }
    
    func advanceQuestions() {
        model.advanceCurrentQuestionIndex()
        startTimer()
    }
    
    func endSession() {
        model.endSession()
    }
    
    //MARK: - Helpers
    
    
    func playSoundFor(_ answerCorrect: Bool) {
        let nameOfSound = answerCorrect ? "correctAnswer" : "incorrectAnswer"
        
        guard let url = Bundle.main.url(forResource: nameOfSound, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }

}
