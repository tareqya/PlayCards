//
//  WinnerView.swift
//  PlayCards
//
//  Created by Tareq Yassin on 14/06/2023.
//

import SwiftUI

struct WinnerView: View {
    var winnerName:String
    var score:Int
    var body: some View {
        VStack {
            HStack (alignment: .center){
                Text("The Winner is:")
                    .foregroundColor(.accentColor)
                    .font(.title)
                    .bold()
                
                Text(winnerName)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("ColorStrawberryDark"))
            }.padding()
            
            HStack (alignment: .center){
                Text("Score:")
                    .foregroundColor(.accentColor)
                    .font(.title)
                    .bold()
                Text(String(score))
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("ColorStrawberryDark"))
            }
            .padding()
            
          
            
        }.padding()
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView(winnerName: "PC", score:0)
    }
}
