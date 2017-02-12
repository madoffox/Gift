//
//  WallGenerator.swift
//  Gift
//
//  Created by Admin on 16.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import SpriteKit

class WallGenerator: SKSpriteNode {
    
    var generationTimer: Timer?
    var walls = [Wall]()
    var wallTrackers = [Wall]()
    
    func startGeneratingWallsEvery(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(WallGenerator.generateWall), userInfo: nil, repeats: true)
        
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    func generateWall() {
        var scale: CGFloat
        let wall = Wall()
        let rand = arc4random_uniform(2)
        if rand == 0 {
            scale = -1.0
            wall.flip()
        } else {
            scale = 1.0
        }
        
        
        wall.position.x = size.width/2 + wall.size.width/2
        wall.position.y = scale * (kGroundHeight/2 + wall.size.height/2)
        walls.append(wall)
        wallTrackers.append(wall)
        addChild(wall)
    }
    
    func stopWalls() {
        stopGenerating()
        for wall in walls {
            wall.stopMoving()
        }
    }
    
}
