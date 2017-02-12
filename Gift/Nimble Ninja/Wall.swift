//
//  Wall.swift
//  Gift
//
//  Created by Admin on 16.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import SpriteKit

class Wall: SKSpriteNode {
   
    let WALL_WIDTH: CGFloat = 63.0
    let WALL_HEIGHT: CGFloat = 90.0
    let WALL_COLOR = UIColor.black
    
    
    init() {
        let size = CGSize(width: WALL_WIDTH, height: WALL_HEIGHT)
        super.init(texture: SKTexture(imageNamed: "wall1"), color: WALL_COLOR, size: size)
        
        loadPhysicsBodyWithSize(size: size)
        startMoving()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        
        
        physicsBody?.categoryBitMask = wallCategory
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveBy(x: -kDefaultXToMovePerSecond, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
    
    func flip() {
       
        let translate = SKAction.moveBy(x: 0, y: (-1)*(size.height - WALL_HEIGHT), duration: 0.1)
        let flip = SKAction.scaleY(to: -1, duration: 0.1)
        
        run(translate)
        run(flip)
    }

    
}
