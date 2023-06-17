//
//  ContentView.swift
//  PlayCards
//
//  Created by Tareq Yassin on 14/06/2023.
//

import SwiftUI
import CoreLocation

let LEFT = "LEFT"
let RIGHT = "RIGHT"

struct ContentView: View {

    private let EarthCenter: CLLocationDegrees = 34.817549168324334
    @State private var isNameDialog: Bool = false
    @StateObject private var locationManager:LocationManager = LocationManager()
    @AppStorage("UserName") var userName: String = ""
    
    private var playerSide: String {
        if let location = locationManager.lastLocation {
            if location.coordinate.latitude < EarthCenter {
                return LEFT
            } else {
                return RIGHT
            }
        } else {
            return ""
        }
    }
        
    var body: some View {
        NavigationView{
                HStack {
                    Image("LeftLocation")
                        .resizable()
                        .scaledToFit()
                        .offset(x: playerSide == RIGHT ? -500: 0)
                        .opacity(playerSide == RIGHT ? 0 : 1)
                       .animation(.easeOut(duration: 2), value: playerSide)
                        
                    Spacer()
                    
                    VStack {
                        
                        Spacer()
                        // Enter name button
                        Button(action: {
                            isNameDialog = true
                        }) {
                            Text("Insert Name")
                                .font(.title)
                        }
                        .sheet(isPresented: $isNameDialog) {
                            VStack {
                                TextField("Enter your first name", text: $userName)
                                    .padding()
                                
                                Button("Save") {
                                    isNameDialog = false
                                }
                            }
                        }
                        
                        Text(userName)
                            .font(.title2)
                            .foregroundColor(Color("ColorLimeDark"))
                        
                        Spacer()
                     
                        NavigationLink(destination: GamePlayView(direction:playerSide)) {
                           
                            Text("Start Game")
                                .padding()
                                .background(.blue)
                                .font(.title2)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .bold()
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Image("RightLocation")
                        .resizable()
                        .scaledToFit()
                        .offset(x: playerSide == LEFT ? 500: 0)
                        .opacity(playerSide == LEFT ? 0 : 1)
                       .animation(.easeOut(duration: 2), value: playerSide)
                        
                }
                .padding()
                .onAppear(perform: {
                    locationManager.requestLocationPermission()
                })
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
