//
//  CustomView.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 18.02.2021.
//

import UIKit

class CustomView: UIView {
    
    
    
    var carrierState: CarrierState!
    var penWidth: CGFloat!
    var penColor: UIColor!
    var p1: CGPoint!
    var p2: CGPoint!
    var path: UIBezierPath!
    
    
  
    
    override func layoutSublayers(of layer: CALayer) {
        penWidth = 10.0
        let pens = SaveLoadManager.shared
        carrierState = CarrierState(saveLoadManager: pens)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        p1 = touch?.location(in: self)
        
        
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        p2 = touch?.location(in: self)
        
        carrierState.saveLoadManager.pensArray.append(Pen(p1: p1, p2: p2, color: penColor))
        
        path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        
        p1 = p2
        
        
       
            drawShapeLayer()
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            p2 = touch.location(in: self)
        }
        
        
        
        setNeedsDisplay()
    }
    
    
    func drawShapeLayer(){
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.strokeColor = penColor.cgColor
        shapeLayer.lineWidth = 10
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        
        self.setNeedsDisplay()
        
       
            }

}
    
    
    
    
    
    
    
    
    
    /*
    var point1: CGPoint?
    var point2: CGPoint!
    var lines: Array<Line> = []
    
    override func draw(_ rect: CGRect) {
        
        if let p1 = point1{
            let line = Line(p1: p1, p2: point2, color: .green, stroke_width: 3)
            lines.append(line)
        }
        if lines.count != 0{
            for l in lines{
                l.drawPath()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point1 = touch.location(in: self)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            point2 = touch.location(in: self)
        }
        setNeedsDisplay()
    }
    
    
    */
    
    
    


