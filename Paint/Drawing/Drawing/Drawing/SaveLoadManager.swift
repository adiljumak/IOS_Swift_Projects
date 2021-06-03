//
//  SaveLoadManager.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 19.02.2021.
//

import Foundation
import UIKit


class SaveLoadManager {
    static let shared = SaveLoadManager()
    
    
    public var pensArray = [Pen]()
    
    func save() -> SaveLoad {
        return SaveLoad(pens: self.pensArray)
    }
    
    func load(state: SaveLoad){
        self.pensArray = state.saves
    }
    
    func drawPens(in view: UIView){
        for v in view.layer.sublayers! {
            v.removeFromSuperlayer()
        }
        
        for pen in pensArray{
            let path = UIBezierPath()
            path.move(to: pen.p1)
            path.addLine(to: pen.p2)
            drawShapeLayer(path, pen.color, view)
            drawShapeLayer(path, pen.color, view)
        }
    }
    
    func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
        
        view.setNeedsDisplay()  
    }
}
