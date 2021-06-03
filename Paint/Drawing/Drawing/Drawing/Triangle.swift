//
//  Triangle.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 19.02.2021.
//

import Foundation
import UIKit


class Triangle{
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat
    private var isFilled: Bool
    
    
    init(p1: CGPoint, p2: CGPoint,p3: CGPoint, color: UIColor, stroke_width: CGFloat, isFilled: Bool) {
        self.color = color
        self.isFilled = isFilled
        self.p1 = p1
        self.p2 = p2
        self.p3 = CGPoint(x: CGFloat(min(p1.x, p2.x)), y: CGFloat(max(p1.y,p2.y)))
        self.stroke_width = stroke_width
    }
    
    func drawPath(){
        
        let path = UIBezierPath()
        
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p1)
        
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
        
    }
    
}
