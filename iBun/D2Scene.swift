//
//  D2Scene.swift
//  iBun
//
//  Created by h on 12.06.17.
//  Copyright © 2017 h. All rights reserved.
//

import Foundation
import SpriteKit

class D2Scene: SKScene
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    override init(size: CGSize)
    {
        super.init(size: size)
        
        self.isUserInteractionEnabled = true
        
        backgroundColor = SKColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        
        do
        {
            let scoreLabel = D2ScoreLabel(fontNamed:nil, scene:self)
            addChild(scoreLabel)
        }
        do
        {
            let spaceship:D2SpaceShip = D2SpaceShip(scene:self)
            addChild(spaceship)
            
            let shot:D2Shot = D2Shot(scene:self, spaceship:spaceship)
            scene!.addChild(shot)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //print("on scene")
    }
}