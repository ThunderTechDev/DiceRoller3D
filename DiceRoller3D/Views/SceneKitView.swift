//
//  SceneKitView.swift
//  DiceRoller3D
//
//  Created by Sergio Gonzalez Cristobal on 25/4/23.
//

import SwiftUI
import SceneKit
import AVFoundation


struct SceneKitView: UIViewRepresentable {
    typealias UIViewType = SCNView
    @ObservedObject var diceViewModel = DiceViewModel()
    @Binding var sceneKitView: SCNView?
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, SCNPhysicsContactDelegate {
        var parent: SceneKitView

        init(_ parent: SceneKitView) {
            self.parent = parent
            super.init()
        }

        func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
            let diceNodeNames = ["RedDice", "WhiteDice"]
            if diceNodeNames.contains(contact.nodeA.name ?? "") || diceNodeNames.contains(contact.nodeB.name ?? "") {
                print("Colisión detectada") 
                /*if let audioNode = parent.sceneKitView?.scene?.rootNode.childNode(withName: "AudioNode", recursively: true),
                    let audioPlayer = audioNode.audioPlayers.first,
                    let audioSource = audioPlayer.audioSource {
                    audioNode.runAction(SCNAction.playAudio(audioSource, waitForCompletion: false))
                }*/
            }
        }
    }
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = createScene()
        sceneView.scene = scene
        sceneView.scene?.physicsWorld.contactDelegate = context.coordinator
        sceneView.allowsCameraControl = false
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

        // Carga el archivo de audio
        guard let audioURL = Bundle.main.url(forResource: "HitDice", withExtension: "caf") else {
            print("No se pudo encontrar el archivo de audio")
            return scene
        }

        // Crea una instancia de SCNAudioSource
        let audioSource = SCNAudioSource(url: audioURL)!

        // Configura las propiedades de SCNAudioSource si es necesario
        audioSource.volume = 0.5
        audioSource.isPositional = true
        audioSource.shouldStream = false
        audioSource.loops = false

        // Agrega el SCNAudioSource al nodo raíz de la escena
        let audioNode = SCNNode()
        audioNode.name = "AudioNode"
        audioNode.addAudioPlayer(SCNAudioPlayer(source: audioSource))
        scene.rootNode.addChildNode(audioNode)

        return scene
    }
    
}


