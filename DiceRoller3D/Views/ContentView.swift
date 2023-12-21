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
        GeometryReader { geometry in
            ZStack {
                Image("Background DiceRoller 3D")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
             
                VStack {
                    Spacer()
                
              
                    Text("DiceRoller3D")
                        .font(.custom("Arial Rounded MT Bold", size: geometry.size.width * 0.12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .shadow(color: .black, radius: 20, x: 0, y: 0)
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            
                            .strokeBorder(Color.black, lineWidth: 14)
                       
                        
                        SceneKitView(sceneKitView: $sceneKitView)
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: geometry.size.width * 0.92, height: geometry.size.width * 0.92)
                            .cornerRadius(9)
                      
                    }
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 0.95)
                    .cornerRadius(14)
             
                    Button(action: {
                        if let redDice = sceneKitView?.scene?.rootNode.childNode(withName: "RedDice", recursively: true),
                           let whiteDice = sceneKitView?.scene?.rootNode.childNode(withName: "WhiteDice", recursively: true) {
                            diceViewModel.applyRandomImpulseAndRotation(to: [redDice, whiteDice])
                            diceViewModel.playAudios(sceneKitView: sceneKitView)
                        }
                    }) {
                        Text("Throw Dice")
                            .font(.custom("Arial Rounded MT Bold", size: 20))
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.25)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: geometry.size.height * 0.04, leading: geometry.size.width * 0.04, bottom: geometry.size.height * 0.04, trailing: geometry.size.width * 0.04))
                            .background(Color(red: 8/255, green:155/255, blue: 80/255))
                            .clipShape(Circle())
                            .shadow(color: .white, radius: 30, x: 0, y: 0)
                            .lineLimit(2)
                    }
             
               Spacer()
               Spacer()
               Spacer()
                }
                

               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
