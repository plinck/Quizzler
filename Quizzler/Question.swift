//
//  Question.swift
//  Quizzler
//
//  Created by Paul Linck on 10/23/18.
//  Copyright © 2018 Paul Linck. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
        
    }
    
}
