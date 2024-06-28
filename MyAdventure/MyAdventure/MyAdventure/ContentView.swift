//
//  ContentView.swift
//  MyAdventure
//
//  Created by user937495 on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var controller = AdventureController()
    
    var body: some View {
        VStack {
            if controller.isEnd {
                Text(controller.isSuccess ? "Congratulations! You succeeded in your adventure." : "You failed. Better luck next time.")
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    controller.restart()
                }) {
                    Text("Restart Adventure")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            } else {
                Text(controller.currentQuestion)
                    .font(.largeTitle)
                    .padding()
                
                if let currentAdventure = adventureData.first(where: { $0.question == controller.currentQuestion }) {
                    ForEach(currentAdventure.choices, id: \.text) { choice in
                        Button(action: {
                            controller.makeChoice(choice)
                        }) {
                            Text(choice.text)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 10)
                    }
                }
            }
        }
        .padding()
    }
}


