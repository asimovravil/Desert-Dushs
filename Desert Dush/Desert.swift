//
//  QuizBrain.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import Foundation

struct Desert {
    
    var questionNumber = 0
    var score = 0
    
    var isQuizFinished: Bool {
        return questionNumber >= quiz.count - 1
    }
    
    let quiz = [
        DesertStructure(q: "What is the name of the chocolate factory in 'Charlie and the Chocolate Factory'?", a: ["Candyland Confectionery", "Wonka's Wonderful Factory", "Willy Wonka's Chocolate Factory"], correctAnswer: "Willy Wonka's Chocolate Factory"),
        
        DesertStructure(q: "Which character accompanies Charlie Bucket on his tour of the chocolate factory?", a: ["Augustus Gloop", "Grandpa Joe", "Veruca Salt"], correctAnswer: "Grandpa Joe"),
        
        DesertStructure(q: "What is the name of the river inside the chocolate factory?", a: ["Strawberry River", "Chocolate River", "Vanilla Stream"], correctAnswer: "Chocolate River"),
        
        DesertStructure(q: "What is the first room the children visit inside the chocolate factory?", a: ["The Inventing Room", "The Chocolate Room", "The Fizzy Lifting Drink Room"], correctAnswer: "The Chocolate Room"),
        
        DesertStructure(q: "Who is the eccentric owner of the chocolate factory?", a: ["Charlie Bucket", "Willy Wonka", "Mr. Slugworth"], correctAnswer: "Willy Wonka"),
        
        DesertStructure(q: "What is the name of the boy who is obsessed with chewing gum?", a: ["Mike Teavee", "Violet Beauregarde", "Augustus Gloop"], correctAnswer: "Violet Beauregarde"),
        
        DesertStructure(q: "What is the name of the candy that can make you fly?", a: ["Everlasting Gobstopper", "Fizzy Lifting Drink", "Lickable Wallpaper"], correctAnswer: "Fizzy Lifting Drink"),
        
        DesertStructure(q: "Who becomes the heir to Willy Wonka's chocolate factory at the end of the story?", a: ["Charlie Bucket", "Veruca Salt", "Augustus Gloop"], correctAnswer: "Charlie Bucket"),
        
        DesertStructure(q: "What is the name of the candy that can change flavor throughout the day?", a: ["Fizzy Lifting Drink", "Everlasting Gobstopper", "Lickable Wallpaper"], correctAnswer: "Everlasting Gobstopper"),
        
        DesertStructure(q: "What is the name of the boy who is obsessed with television?", a: ["Mike Teavee", "Augustus Gloop", "Veruca Salt"], correctAnswer: "Mike Teavee")
    ]
    
    mutating func prevQuestion() {
        if questionNumber > 0 {
            questionNumber -= 1
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}
