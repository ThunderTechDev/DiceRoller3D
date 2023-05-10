//
//  ContentView.swift
//  DiceRoller3D
//
//  Created by Sergio Gonzalez Cristobal on 24/4/23.
//

import SwiftUI
import SceneKit
import AVFoundation

struct ContentView: View {
    @StateObject private var diceViewModel = DiceViewModel()
    @State private var sceneKitView: SCNView?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)

        
            VStack {
                Text("DiceRoller3D")
                    .font(.custom("Arial Rounded MT Bold", size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(Color.black, lineWidth: 20)
                    
                    SceneKitView(sceneKitView: $sceneKitView)
                        .frame(width: 385, height: 385)
                        .cornerRadius(9)
                }
                .frame(width: 400, height: 400)
                .cornerRadius(14)
                
                .padding()
                
                Button(action: {
                    if let redDice = sceneKitView?.scene?.rootNode.childNode(withName: "RedDice", recursively: true),
                       let whiteDice = sceneKitView?.scene?.rootNode.childNode(withName: "WhiteDice", recursively: true) {
                        diceViewModel.applyRandomImpulseAndRotation(to: [redDice, whiteDice])
                        diceViewModel.playAudios(sceneKitView: sceneKitView)
                    }
                }) {
                    Text("Lanzar Dados")
                        .font(.custom("Arial Rounded MT Bold", size: 23))
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .bold()
                        .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
                        .background(Color(red: 8/255, green:155/255, blue: 80/255))
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 30, x: 0, y: 0)
                        .lineLimit(2)
                        
                }
            }
            
            .padding()
        }
        }
        
        
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
