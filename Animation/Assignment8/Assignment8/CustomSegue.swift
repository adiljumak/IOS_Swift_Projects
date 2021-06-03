//
//  CustomSegue.swift
//  Assignment8
//
//  Created by Adilzhan Jumakanov on 01.04.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    
    override func perform() {
        let destination_view = self.destination.view
        let source_view = self.source.view
        
        //destination_view?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 4) {
            source_view?.alpha = 0
        } completion: { (Bool) in
            destination_view?.alpha = 0
            self.source.present(self.destination, animated: false) {
                UIView.animate(withDuration: 0.1){
                    destination_view?.alpha = 1
                    //destination_view?.transform = CGAffineTransform(scaleX: <#T##CGFloat#>, y: <#T##CGFloat#>)
                    
                    
                }
            }
        }

    }

}
