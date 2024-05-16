//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Fatih Oğuz on 16.05.2024.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        
       //let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        let world = createSephere(radius: 0.3, content: "world.jpg", vector: SCNVector3(x: 0, y: 0, z: -1))
        sceneView.scene.rootNode.addChildNode(world)
        let mars = createSephere(radius: 0.2, content: "mars.jpg", vector: SCNVector3(x: 2, y: 0, z: 0))
        sceneView.scene.rootNode.addChildNode(mars)
        let moon = createSephere(radius: 0.1, content: "moon.jpg", vector: SCNVector3(x: -1, y: 0, z: 0))
        sceneView.scene.rootNode.addChildNode(moon)
        
        
        
        sceneView.automaticallyUpdatesLighting = true
        
    }
    func createSephere(radius: CGFloat, content:String, vector: SCNVector3) -> SCNNode{
        let mySphere = SCNSphere(radius: radius)
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        mySphere.materials = [boxMaterial]
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        sceneView.scene.rootNode.addChildNode(node)
        return node
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
