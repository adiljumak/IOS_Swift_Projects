//
//  Circle.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 18.02.2021.
//

import Foundation
import UIKit

class Circle{
    private var radius: CGFloat
    private var circle_center: CGPoint
    private var color: UIColor
    private var stroke_width: CGFloat
    private var isFilled: Bool
    
    
    
    init(with radius: CGFloat, and circle_center: CGPoint, withSome color: UIColor, and stroke_width: CGFloat, isFilled: Bool){
        self.circle_center = circle_center
        self.radius = radius
        self.isFilled = isFilled
        self.stroke_width = stroke_width
        self.color = color
    }
    
    func drawPath(){
        let path = UIBezierPath(arcCenter: circle_center, radius: radius, startAngle: 0, endAngle: 2*Double.pi.cg, clockwise: true)
        path.lineWidth = stroke_width
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
    }
    
}
extension Double{
    var cg: CGFloat{
        return CGFloat(self)
    }
}
