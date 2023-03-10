//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Daniel Schepisi on 19/3/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
    Question(q: "A slug's blood is green.", a: "True"),
     Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
     Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
     Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
     Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
     Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
     Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
     Question(q: "Google was originally called 'Backrub'.", a: "True"),
     Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
     Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
     Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
     Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
     ]
    
    
    let multipleChoiceQuiz = [
    MultipleChoiceQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
    MultipleChoiceQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
    MultipleChoiceQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
    MultipleChoiceQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
    MultipleChoiceQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
    MultipleChoiceQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
    MultipleChoiceQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
    MultipleChoiceQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
    MultipleChoiceQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
    MultipleChoiceQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    
    var totalNumberOfQuestions = 0
    var questionNumber = 0
    var progress = Float(0)
    var questionsCorrect = 0
    
    
  mutating  func isAnswerCorrect(_ guess: String) -> Bool{
        
        var answer = false
        
        if guess == quiz[questionNumber].answer {
            questionsCorrect += 1
            answer = true
        }
        return answer
    }
    
    
    mutating func increaseStats(){
        
        if totalNumberOfQuestions - 1 > questionNumber{
        questionNumber += 1
        } else{
            questionNumber = 0
        }

        progress = Float(questionNumber + 1) / Float(totalNumberOfQuestions)
    }
    
    func getQuestionText() -> String {
      return  quiz[questionNumber].text
    }
    
    func getScore() -> Int{
        
        return questionsCorrect
    }
    
}
