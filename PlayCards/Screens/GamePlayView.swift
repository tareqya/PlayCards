//
//  GamePlayView.swift
//  PlayCards
//
//  Created by Tareq Yassin on 14/06/2023.
//

import SwiftUI

let Deck: [Card] = [
    Card(number: 1, image: "card2"),
    Card(number: 2, image: "card3"),
    Card(number: 3, image: "card4"),
    Card(number: 4, image: "card5"),
    Card(number: 5, image: "card6"),
    Card(number: 6, image: "card7"),
    Card(number: 7, image: "card8"),
    Card(number: 8, image: "card9"),
    Card(number: 9, image: "card10"),
    Card(number: 10, image: "card11"),
    Card(number: 11, image: "card12"),
    Card(number: 12, image: "card13"),
    Card(number: 13, image: "card14")
]

struct GamePlayView: View {
    private let ROUNDS:Int = 10
    
    @Environment(\.presentationMode) var presentationMode

    @AppStorage("UserName") var playerName: String = "Player"

    @State private var gameView:Bool = true
    @State private var winner:String = ""
    @State private var winnerScore:Int = 0
    
    @State private var playerScore:Int = 0
    @State private var pcScore:Int = 0
    var direction:String
    @State private var playerCard: Card = Card(number: 0, image: "hidden")
    @State private var pcCard: Card = Card(number: 0, image: "hidden")

    @State private var delay:Int = 5
    @State private var timer: Timer?
    @State private var round: Int = 0
   
    
    var body: some View {
        if gameView {
            GameView(seconds: delay, playerName: playerName, playerScore: playerScore, pcScore: pcScore, direction: direction, playerCard: playerCard, pcCard: pcCard)
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
        }else {
            VStack{
                    WinnerView(winnerName: winner, score: winnerScore)
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("BACK TO MENU")
                            .padding()
                            .background(Color("ColorStrawberryDark"))
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if delay > 0 {
                delay -= 1
                if delay <= 1 {
                    playerCard = Card(number: 0, image: "hidden")
                    pcCard = Card(number: 0, image: "hidden")
                }
            }else {
                if round == ROUNDS {
                    if playerScore > pcScore {
                        winner = playerName
                        winnerScore = playerScore
                    }else {
                        winner = "PC"
                        winnerScore = pcScore
                    }
                    gameView = false
                    stopTimer()
                }else {
                    delay = 5
                    round += 1
                    playerCard = Deck.randomElement() ?? Card(number: 0, image: "hidden")
                    pcCard = Deck.randomElement() ?? Card(number: 0, image: "hidden")
                    
                    if playerCard.number > pcCard.number {
                        playerScore += 1
                    }else if playerCard.number < pcCard.number {
                        pcScore += 1
                    }
                }
                
            }
        }
    }
    
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

struct GamePlayView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView(direction: LEFT)
    }
}
