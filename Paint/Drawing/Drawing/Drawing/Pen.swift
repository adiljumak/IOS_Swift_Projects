//
//  Pen.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 19.02.2021.
//

import Foundation
import UIKit


class Pen{
    public var p1: CGPoint
    public var p2: CGPoint
    public var color: UIColor
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
    }
}
