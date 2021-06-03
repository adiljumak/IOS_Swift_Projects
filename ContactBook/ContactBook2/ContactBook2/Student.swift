//
//  Student.swift
//  ContactBook2
//
//  Created by Adilzhan Jumakanov on 07.03.2021.
//

import Foundation
import UIKit

class Student{
    
    var nameAndSurname: String?
    var gpa: String?
    var image: UIImage?
    
    init(_ nameAndSurname: String, _ gpa: String, _ image: UIImage){
        self.nameAndSurname=nameAndSurname
        self.gpa=gpa
        self.image = image
    }
    
    
    
}
