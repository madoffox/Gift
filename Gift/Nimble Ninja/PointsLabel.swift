//
//  PointsLabel.swift
//  Gift
//
//  Created by Admin on 16.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class PointsLabel: SKLabelNode {
    
    var number = 0
    
    init(num: Int) {
        super.init()
        
        fontColor = UIColor.black
        fontName = "Helvetica"
        fontSize = 24.0
        
        number = num
        text = "\(num)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func increment() {
        number += 1
        text = "\(number)"
        kDefaultXToMovePerSecond += 10
    }
    
    func setTo(num: Int) {
        self.number = num
        text = "\(self.number)"
    }
    
}
