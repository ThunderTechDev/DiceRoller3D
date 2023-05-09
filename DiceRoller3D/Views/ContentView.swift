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
        VStack {
            Text("DiceRoller3D")
                .font(.custom("Arial Rounded MT Bold", size: 50))
                .fontWeight(.bold)
                .foregroundColor(Color.cyan)
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(Color.black, lineWidth: 20)
                
                SceneKitView(sceneKitView: $sceneKitView)
                    .frame(width: 385, height: 385)
                    .cornerRadius(9)
            }
            .frame(width: 400, height: 400)
            .cornerRadius(14)
            
            Button("Lanzar dados", action: {
                if let redDice = sceneKitView?.scene?.rootNode.childNode(withName: "RedDice", recursively: true),
                   let whiteDice = sceneKitView?.scene?.rootNode.childNode(withName: "WhiteDice", recursively: true) {
                    diceViewModel.applyRandomImpulseAndRotation(to: [redDice, whiteDice])
                    diceViewModel.playAudios(sceneKitView: sceneKitView)
                }
            })
            .frame(width: 100, height: 100)

        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
