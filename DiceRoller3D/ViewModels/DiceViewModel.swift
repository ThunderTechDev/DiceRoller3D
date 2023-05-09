//
//  DiceViewModel.swift
//  DiceRoller3D
//
//  Created by Sergio Gonzalez Cristobal on 4/5/23.
//

import UIKit
import SceneKit
import AVFoundation



class DiceViewModel: ObservableObject {
 
    
    
    
    func applyRandomImpulseAndRotation(to nodes: [SCNNode]) {
        let forceRange: ClosedRange<Float> = 5...7
        let torqueRange: ClosedRange<Float> = -5...5

        for node in nodes {
            let forceX = Float.random(in: forceRange)
            let forceY = Float.random(in: forceRange)
            let forceZ = Float.random(in: forceRange)
            let force = SCNVector3(forceX, forceY, forceZ)

            let torqueX = Float.random(in: torqueRange)
            let torqueY = Float.random(in: torqueRange)
            let torqueZ = Float.random(in: torqueRange)
            let torque = SCNVector4(torqueX, torqueY, torqueZ, 1)

            let physicsBody = node.physicsBody
            physicsBody?.applyForce(force, asImpulse: true)
            physicsBody?.applyTorque(torque, asImpulse: true)
        }
    
        
        
        
    }
    
    func playAudios(sceneKitView: SCNView?) {
           if let audioNode = sceneKitView?.scene?.rootNode.childNode(withName: "AudioNode", recursively: true),
              let audioPlayer = audioNode.audioPlayers.first,
              let audioSource = audioPlayer.audioSource {
               audioNode.runAction(SCNAction.playAudio(audioSource, waitForCompletion: false))
           }
        
        
       }
    
    
    /*
    func addSoundToDice(scene: SCNScene) {
        guard let audioSource = SCNAudioSource(named: "HitDice.caf") else {
            print("Failed to load audio source")
            return
        }
        //audioSource.isPositional = true
        audioSource.volume = 1.0
        audioSource.load()
        let audioNode = SCNNode()
        audioNode.name = "AudioNode"
        audioNode.addAudioPlayer(SCNAudioPlayer(source: audioSource))
        scene.rootNode.addChildNode(audioNode)
    } */
}
