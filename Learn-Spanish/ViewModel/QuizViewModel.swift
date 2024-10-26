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
    var currentQuestion: QuizQuestion? { model.currentQuestion }
    
    
    //MARK: - Init
    
    init(topic: Topic) {
        self.model = QuizSession(topic: topic)
    }

    //MARK: - User Intents
    
    func answerQuestionWith(_ answer: Bool) {
        //TODO
    }
    
    func advanceQuestions() {
        //TODO
    }
    

    
}
