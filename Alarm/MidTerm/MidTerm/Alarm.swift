//
//  Alarm.swift
//  MidTerm
//
//  Created by Adilzhan Jumakanov on 12.03.2021.
//


import Foundation


class Alarm{
    var time: String?
    var active: Bool?
    var note: String?
    
    
    init(_ time: String, _ active: Bool, _ note: String) {
        self.time = time
        self.active = active
        self.note = note
    }
    
}
