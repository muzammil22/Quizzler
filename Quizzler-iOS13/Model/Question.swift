//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Muzammil Muneer on 19/02/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    let options: [String]
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = correctAnswer
        options = a
    }
}
