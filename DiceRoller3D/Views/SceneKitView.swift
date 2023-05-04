//
//  SceneKitView.swift
//  DiceRoller3D
//
//  Created by Sergio Gonzalez Cristobal on 25/4/23.
//

import SwiftUI
import SceneKit

struct SceneKitView: UIViewRepresentable {
    typealias UIViewType = SCNView
    
    @Binding var sceneKitView: SCNView?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator {
        var parent: SceneKitView
        
        init(_ parent: SceneKitView) {
            self.parent = parent
        }
    }
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = createScene()
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = .cyan
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        DispatchQueue.main.async {
            self.sceneKitView = uiView
        }
    }
    
    func createScene() -> SCNScene {
        guard let scene = SCNScene(named: "DiceMatScene.scn") else {
            fatalError("Failed to load MyScene.scn")
        }
        return scene
    }
}
