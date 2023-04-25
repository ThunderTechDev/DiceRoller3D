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
        let scene = SCNScene()
        
        let box1 = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let boxNode1 = SCNNode(geometry: box1)
        boxNode1.position = SCNVector3(-1, 0, 0)
        scene.rootNode.addChildNode(boxNode1)
        
        let box2 = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let boxNode2 = SCNNode(geometry: box2)
        boxNode2.position = SCNVector3(1, 0, 0)
        scene.rootNode.addChildNode(boxNode2)
        
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 2, 3)
        cameraNode.look(at: SCNVector3(0,0,0))
        scene.rootNode.addChildNode(cameraNode)
        
        return scene
        
    }
    
    
}
