//
//  D2Back.swift
//  iBun
//
//  Created by h on 13.06.17.
//  Copyright © 2017 h. All rights reserved.
//

import Foundation
import SpriteKit

class D2Back : SKSpriteNode
{
    var viewController:UIViewController? = nil;
    var onPressed:(()->())? = nil;
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    init(scene:SKScene, viewController:UIViewController, onPressed:(()->())?) //constructor needs the scene to be able to scale & position the object in the scene
    {
        self.viewController = viewController;
        self.onPressed = onPressed;
        let texture = SKTexture(imageNamed: "left-arrow")
        let size:CGSize = CGSize(width:(scene.frame.size.width / 10),height:(scene.frame.size.height / 10))
        super.init(texture: texture, color: UIColor.clear, size: size)
        self.position = CGPoint(x: size.width / 2, y: scene.size.height - (self.frame.size.height/2))
        self.isUserInteractionEnabled = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if((self.onPressed) != nil)
        {
            self.onPressed!();
            return;
        }
        self.viewController!.presentingViewController?.dismiss(animated: true, completion: nil)
        //(self.scene as? D2Scene)?.d2Controller!.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
