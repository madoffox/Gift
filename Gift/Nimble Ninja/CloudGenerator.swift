//
//  CloudGenerator.swift
//  Gift
//
//  Created by Admin on 16.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import SpriteKit

class CloudGenerator: SKSpriteNode {
    
    let CLOUD_WIDTH: CGFloat = 125.0
    let CLOUD_HEIGHT: CGFloat = 55.0
    
    var generationTimer: Timer!
    
    func populate(num: Int) {
        for _ in 0 ..< num {
            let cloud = Cloud(size: CGSize(width: CLOUD_WIDTH, height: CLOUD_HEIGHT))
            let x = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width/2
            let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
            cloud.position = CGPoint(x: x, y: y)
            cloud.zPosition = -1
            addChild(cloud)
        }
    }
    
    func startGeneratingWithSpawnTime(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(CloudGenerator.generateCloud), userInfo: nil, repeats: true)
    }
    
    func stopGenerating() {
        generationTimer.invalidate()
    }
    
    func generateCloud() {
        let x = size.width/2 + CLOUD_WIDTH/2
        let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
        let cloud = Cloud(size: CGSize(width: CLOUD_WIDTH, height: CLOUD_HEIGHT))
        cloud.position = CGPoint(x: x, y: y)
        cloud.zPosition = -1
        addChild(cloud)
    }
    
}
