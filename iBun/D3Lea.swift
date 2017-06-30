//
//  D3Lea.swift
//  iBun
//
//  Created by h on 30.06.17.
//  Copyright © 2017 h. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import QuartzCore
import SceneKit

class D3Lea : D3Destroyable
{
    static let NAME = "landscape";
    var NAME_OF_MODEL_NODE:String = "";
    
    override init(scnNode:SCNNode)
    {
        super.init(scnNode:scnNode)
    }
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    override func getName() -> String
    {
        return super.getName() + ":" + NAME_OF_MODEL_NODE;
    }
    
    //static let LEA_BLUEPRINT = Globals.node(name: "d3.scnassets/lea/lea" , ext: "obj", id: nil);
    
    class func create(scene:D3LScene) -> D3Lea
    {
        let scnScene = SCNScene(named:"d3.scnassets/lea/lea.obj");
        let scnNode = scnScene?.rootNode;
        /*let url = NSURL(string: "d3.scnassets/lea/lea.obj")
        let url = URL.init(fileURLWithPath: "d3.scnassets/lea/lea.obj")
        let asset = MDLAsset(url: url);
        let object = asset.object(at: 0);
        let scnScene = SCNScene(MDLAsset: object);
        let scnNode = SCNNode(MDLAsset: object);
        */
        let n = D3Lea(scnNode:scnNode!);
        n.name = D3TreeNode.NAME;
        
        
        n.physicsBody = D3Node.createBody(sType: D3LandNode.NAME, type:.dynamic, geo: n.geometry!, scale:n.scale);
        
        return n;

    }
}