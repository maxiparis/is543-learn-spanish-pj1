//
//  QuizSession.swift
//  Learn-Spanish
//
//  Created by Maximiliano París Gaete on 10/25/24.
//

import Foundation

struct QuizSession {
    
    //MARK: - Constants
    
    struct Constants {
        static let maxNumberOfSeconds: TimeInterval = 20 //If the time is higher than 20 then we dont calcualate it
        static let baseScore: Int = 10 //Only when it is correct
    }
    
    
    //MARK: - Properties
    
    private var persistenceManager = PersistenceManager.shared
    var topic: Topic
    var questions: [QuizQuestion] = []
    var score: Int = 0
    var currentQuestionIndex = 0
    var currentQuestion: QuizQuestion {
        questions[currentQuestionIndex]
    }
    var questionsLeft: Int {
        questions.count - currentQuestionIndex //TODO: check if this is correct
    }
    
    //MARK: - init
    
    init(topic: Topic) {
        self.topic = topic
        self.questions = generateQuizQuestions()
    }

    
    //MARK: - Business Logic
    
    ///
    mutating func advanceCurrentQuestionIndex() {
        currentQuestionIndex = min(currentQuestionIndex + 1, questions.count - 1)
    }
    
    /// Validates the answer and updates the score, does not move to next question automatically
    mutating func validateAnswer(_ answer: Bool, seconds: TimeInterval) {
        questions[currentQuestionIndex].answer = answer
        if let answerCorrect = questions[currentQuestionIndex].isAnswerCorrect {
            score += computeQuestionScore(seconds: seconds, wasCorrect: answerCorrect)
        }
    }
    
    /// Calculates the score for a specific question
    func computeQuestionScore(seconds: TimeInterval, wasCorrect: Bool) -> Int {
        
        guard wasCorrect else { return 0 }
        
        var totalScore = 10
        
        if seconds < Constants.maxNumberOfSeconds {
            let timeScore = ceil((Constants.maxNumberOfSeconds - seconds) / 2.0) // `ceil` rounds up
            
            totalScore += Int(timeScore)
        }
        
        return totalScore
    }
    
    /// Create the questions according to the topic.Lessons
    func generateQuizQuestions() -> [QuizQuestion] {
        // TODO
        var questions: [QuizQuestion] = []
        for lesson in topic.lessons {
            let question = QuizQuestion(
                wordInEnglish: lesson.phraseInEnglish,
                wordInSpanish: lesson.phraseInSpanish,
                prompt: randomizePrompt(correctWord: lesson.phraseInSpanish)
            )
            
            questions.append(question)
        }
        return questions
    }
    
    //MARK: - Helpers
    
    //
    func randomizePrompt(correctWord: String) -> String {
        let randomInt = Int.random(in: 1...10) // Random integer between 1 and 10
        if randomInt < 4 {
            return correctWord
        } else {
            return topic.lessons.randomElement()?.phraseInSpanish ?? "Error!"
        }
    }

}


struct QuizQuestion {
    var wordInEnglish: String
    var wordInSpanish: String
    var prompt: String
    var isPromptCorrectAnswer: Bool
    var hasBeenAnswered: Bool {
        answer != nil
    }
    var answer: Bool?
    var isAnswerCorrect: Bool? {
        guard hasBeenAnswered else { return nil }
        return answer == isPromptCorrectAnswer
    }
    
    init(wordInEnglish: String, wordInSpanish: String, prompt: String) {
        self.wordInEnglish = wordInEnglish
        self.wordInSpanish = wordInSpanish
        self.prompt = prompt
        self.isPromptCorrectAnswer = {
            if prompt == wordInSpanish {
                return true
            }
            return false
        }()
    }
}
