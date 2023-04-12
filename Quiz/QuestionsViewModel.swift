//
//  QuestionsViewModel.swift
//  Quiz
//
//  Created by David Svensson on 2023-04-12.
//

import Foundation


class QuestionsViewModel : ObservableObject {
    var questions = [Question(question: "När är julafton?", correctAnswer: "24 dec",
                              incorrectAnswers: ["1 jan", "6 maj", "9 dec"]),
                     Question(question: "Vilket är bäst?", correctAnswer: "Zoom",
                                               incorrectAnswers: ["discord", "teams", "slack"]),
                     Question(question: "Vilket är svårast?", correctAnswer: "Java",
                                               incorrectAnswers: ["swift", "kotlin", "javascript"]),
                     Question(question: "Hur högt är eifeltornet", correctAnswer: "324 m",
                                               incorrectAnswers: ["34 m", "1045 m", "456 m"])
                    ]
    
    @Published var currentQuestion : Question
    private var currentIndex = 0
    
    init() {
        questions.shuffle()
        currentQuestion = questions[currentIndex]
    }
    
    
    func currentAnswers() -> [String] {
        var answers = currentQuestion.incorrectAnswers
        answers.append(currentQuestion.correctAnswer)
        answers.shuffle()
        return answers
    }
    
    func nextQuestion() {
        print(currentIndex)
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            questions.shuffle()
            currentIndex = 0
        }
        currentQuestion = questions[currentIndex]
    }
}
