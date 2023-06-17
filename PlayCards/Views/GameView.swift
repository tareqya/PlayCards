//
//  GameView.swift
//  PlayCards
//
//  Created by Tareq Yassin on 14/06/2023.
//

import SwiftUI

struct GameView: View {
    var seconds: Int
    var playerName:String
    var playerScore:Int
    var pcScore:Int
    var direction: String
    var playerCard: Card
    var pcCard: Card
    var body: some View {
        HStack {
            VStack {
                Text("PC")
                    .foregroundColor(Color("ColorBlueberryDark"))
                    .font(.title)
                Text(String(pcScore))
                    .foregroundColor(Color("ColorGrapefruitDark"))
                    .font(.title2)
                
                
                Image(pcCard.image)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            VStack{
                Image(systemName: "timer")
                      .font(.system(size: 30))
                      .padding(2)

                Text(String(seconds))
                      .font(.title)
            }
            Spacer()
            VStack {
                Text(playerName)
                    .foregroundColor(Color("ColorBlueberryDark"))
                    .font(.title)
                Text(String(playerScore))
                    .foregroundColor(Color("ColorGrapefruitDark"))
                    .font(.title2)
                
                Image(playerCard.image)
                    .resizable()
                    .scaledToFit()
            }
        }
        .environment(\.layoutDirection, direction == LEFT ? .rightToLeft : .leftToRight)
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(seconds: 0, playerName: "Player", playerScore: 0, pcScore: 0, direction: LEFT, playerCard: Card(number: 0, image: "hidden"), pcCard: Card(number: 0, image: "hidden"))
    }
}
