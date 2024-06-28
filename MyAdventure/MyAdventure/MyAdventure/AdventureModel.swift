//
//  AdventureModel.swift
//  MyAdventure
//
//  Created by user937495 on 6/26/24.
//

import Foundation
import SwiftUI

struct Adventure {
    var question: String
    var choices: [Choice]
}

struct Choice {
    var text: String
    var nextQuestion: String?
    var isEnd: Bool
    var isSuccess: Bool
}

let adventureData = [
    Adventure(
        question: "You find yourself in a dark forest. What do you do?",
        choices: [
            Choice(text: "Explore the forest", nextQuestion: "You see a strange light in the distance. What do you do?", isEnd: false, isSuccess: false),
            Choice(text: "Look for a way out", nextQuestion: "You find a path leading out of the forest. What do you do?", isEnd: false, isSuccess: false)
        ]
    ),
    Adventure(
        question: "You see a strange light in the distance. What do you do?",
        choices: [
            Choice(text: "Approach the light", nextQuestion: nil, isEnd: false, isSuccess: true),
            Choice(text: "Ignore the light", nextQuestion: nil, isEnd: false, isSuccess: false)
        ]
    ),
    Adventure(
        question: "You find a path leading out of the forest. What do you do?",
        choices: [
            Choice(text: "Follow the path", nextQuestion: nil, isEnd: true, isSuccess: true),
            Choice(text: "Stay in the forest", nextQuestion: nil, isEnd: true, isSuccess: false)
        ]
    )
]
