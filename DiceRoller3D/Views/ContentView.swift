//
//  ContentView.swift
//  DiceRoller3D
//
//  Created by Sergio Gonzalez Cristobal on 24/4/23.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        
        
        VStack {
            Text("DiceRoller3D")
                .font(.custom("Arial Rounded MT Bold", size: 50))
                .fontWeight(.bold)
                .foregroundColor(Color.cyan)
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(Color.black, lineWidth: 20)
                    
                
                SceneKitView()
                    .frame(width: 385, height: 385)
                    .cornerRadius(9)
                    
            }
            .frame(width: 400, height: 400)
            .cornerRadius(14)
            
            Button("Lanzar dados", action: {
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
