//
//  AdventureController.swift
//  MyAdventure
//
//  Created by user937495 on 6/26/24.
//

import Foundation
import SwiftUI

class AdventureController: ObservableObject {
    @Published var currentQuestion: String = "You find yourself in a dark forest. What do you do?"
    @Published var isEnd: Bool = false
    @Published var isSuccess: Bool = false
    
    func makeChoice(_ choice: Choice) {
        if choice.isEnd {
            isEnd = true
            isSuccess = choice.isSuccess
        } else {
            if let nextQuestion = choice.nextQuestion {
                currentQuestion = adventureData.first(where: { $0.question == nextQuestion })?.question ?? "The End"
            } else {
                currentQuestion = "The End"
                isEnd = true
            }
        }
    }
    
    func restart() {
        currentQuestion = "You find yourself in a dark forest. What do you do?"
        isEnd = false
        isSuccess = false
    }
}

