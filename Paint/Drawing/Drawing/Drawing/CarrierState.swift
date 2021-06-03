//
//  CarrierState.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 19.02.2021.
//

import Foundation

class CarrierState{
    var state: SaveLoad?
    var saveLoadManager: SaveLoadManager
    
    init(saveLoadManager: SaveLoadManager) {
        self.saveLoadManager = saveLoadManager
    }
    
    
    public func savePen(){
        state = saveLoadManager.save()
    }
    
    
    func loadPen(){
        guard state != nil else {return}
        saveLoadManager.load(state: state!)
    }
}
