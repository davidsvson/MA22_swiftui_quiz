//
//  ContentView.swift
//  Quiz
//
//  Created by David Svensson on 2023-04-12.
//

import SwiftUI

// model - viewmodel - view

struct ContentView: View {
    
    @StateObject var questionsVM = QuestionsViewModel()
    
    @State var score : Int = 0
    
    var body: some View {
        VStack {
                Text(String(score))
           
                Spacer()
            Text(questionsVM.currentQuestion.question)
                Spacer()
            ForEach( questionsVM.currentAnswers(), id: \.self) {answer in
                Button(action: {
                    handleAnswer(answer: answer)
                }) {
                    Text(answer)
                }
            }
            Spacer()
            
        }
        .onAppear {
           nextQuestion()
        }
    }
    
    func handleAnswer(answer: String) {
        
        // kolla om korrekt svar
        if answer == questionsVM.currentQuestion.correctAnswer {
            print("correct")
            // ge poäng
            score += 1
        }
        
        // gå vidare till nästa fråga
        nextQuestion()
    }
    
    func nextQuestion() {
        questionsVM.nextQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Quiz app

// x enkel layout för en fråga och svarsalternativ
// x lista av frågor

// x ta emot emot input för svarsalternativ (knappar?)
// x gå vidare till nästa fråga
// x räkna poäng


// x  mvvm struktur

//   slumpa ordning på svarsalternativ  - ändra viewmodel och view
//   inte samma fråga två gånger i rad  - ändra viewmodel
//   knapparna som egna views
