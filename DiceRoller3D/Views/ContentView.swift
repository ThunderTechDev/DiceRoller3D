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
            SceneKitView()
                .frame(height: 400)
                .border(Color.black, width: 4)
        }
        
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
