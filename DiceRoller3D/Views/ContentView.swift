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
            Image("Background DiceRoller 3D")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .edgesIgnoringSafeArea(.all)

        
            VStack {
                Text("DiceRoller3D")
                    .font(.custom("Arial Rounded MT Bold", size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .shadow(color: .black, radius: 20, x: 0, y: 0)
                    
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(Color.black, lineWidth: 20)
                    
                    SceneKitView(sceneKitView: $sceneKitView)
                        .aspectRatio(1, contentMode: .fit)
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
                        .font(.custom("Arial Rounded MT Bold", size: 17))
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                        .background(Color(red: 8/255, green:155/255, blue: 80/255))
                        .clipShape(Circle())
                        .shadow(color: .white, radius: 30, x: 0, y: 0)
                        .lineLimit(2)
                        
                }
                
            }
            
            .padding(.bottom, 15)
        }
        
        }
        
        
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
            .previewDisplayName("iPhone 11")
        ContentView()
            .previewDisplayName("iPad Pro")
            .previewDevice("iPad Pro (11-inch) (4th generation)")
    }
}
