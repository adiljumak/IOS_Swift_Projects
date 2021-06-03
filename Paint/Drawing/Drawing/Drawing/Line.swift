//
//  Line.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 19.02.2021.
//

import Foundation
import UIKit


class Line{
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat
    
    init(p1: CGPoint, p2: CGPoint, color: UIColor, stroke_width: CGFloat) {
        self.color = color
        self.p1 = p1
        self.p2 = p2
        self.stroke_width = stroke_width
    }
    
    func drawPath(){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: p1.x, y:p1.y))
        path.addLine(to: CGPoint(x: p2.x, y: p2.y))
        
        path.lineWidth = stroke_width
        color.set()
        path.stroke()
    }
    
}
