//
//  QuizViewModel.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/25/24.
//

import Foundation

@Observable class QuizViewModel {
    
    //MARK: - Variables

    var model: QuizSession
    var timer = Timer() //TODO: maybe another class for this?
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
    var secondsLeft: TimeInterval = 20
    
    
    //MARK: - Init
    
    init(topic: Topic) {
        self.model = QuizSession(topic: topic)
    }

    //MARK: - User Intents
    
    func answerQuestionWith(_ answer: Bool) {
        //TODO
        model.validateAnswer(answer, seconds: 15)
    }
    
    func advanceQuestions() {
        model.advanceCurrentQuestionIndex()
    }
    

    
}
