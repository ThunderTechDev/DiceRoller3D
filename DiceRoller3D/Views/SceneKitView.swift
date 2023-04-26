//
//  SceneKitView.swift
//  DiceRoller3D
//
//  Created by Sergio Gonzalez Cristobal on 25/4/23.
//

import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = createScene()
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .cyan
        
        return sceneView
        
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
    
    
    func createScene() -> SCNScene {
        guard let scene = SCNScene(named: "DiceMatScene.scn") else {
            fatalError("Failed to load MyScene.scn")
        }
        return scene
    }
    
    
}
