//
//  CustomCell.swift
//  Assignment8
//
//  Created by Adilzhan Jumakanov on 02.04.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var phones = [Phone.init(name: "Iphone 7 Plus", price: 350, CPUname: "A10 Fusion", camera: "12MPX"),
              Phone.init(name: "Samsung Galaxy S8", price: 500, CPUname: "Snapdragon 835", camera: "12MPX"),
              Phone.init(name: "LG G4", price: 400, CPUname: "Snapdragon 808", camera: "16MPX")]
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    static var index = 0
    @IBOutlet weak var newView: UIView!
    
    @IBOutlet weak var myView: UIView!
    
    var isFlipped = false
    @IBOutlet weak var buttonUIButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var buttonClicked: UIView!
    
    @IBOutlet weak var CellmyCell: UIButton!
    @IBAction func myButtonClicked(_ sender: UIButton) {
        
        
        UIView.transition(with: contentView, duration: 2.0, options: isFlipped ? .transitionFlipFromRight : .transitionFlipFromLeft, animations:{
            if !self.isFlipped{
                self.name.text = self.phones[CustomCell.index].CPU
                self.price.text = self.phones[CustomCell.index].camera
                self.myView.backgroundColor = .init(#colorLiteral(red: 1, green: 0.5627172589, blue: 0.5636429191, alpha: 1))
                self.buttonUIButton.setTitle("Back", for: .normal)
                self.buttonUIButton.setTitleColor(.white, for: .normal)
                
                self.buttonUIButton.layer.cornerRadius = 10.0
                self.buttonUIButton.layer.borderWidth = 2
                self.buttonUIButton.layer.borderColor = CGColor.init(red: 255 , green: 255, blue: 255, alpha: 1)
                
            }
                
            else {
                self.name.text = self.phones[CustomCell.index].name
                self.price.text = String(self.phones[CustomCell.index].price!) + "$"
                self.myView.backgroundColor = .white
                self.buttonUIButton.setTitle("See", for: .normal)
                
                self.buttonUIButton.setTitleColor(.black, for: .normal)
                
                self.buttonUIButton.layer.cornerRadius = 10.0
                self.buttonUIButton.layer.borderWidth = 2
                self.buttonUIButton.layer.borderColor = CGColor.init(red: 0 , green: 0, blue: 0, alpha: 1)
            }
            
            
        }
            , completion: nil)
        
        isFlipped = !isFlipped
    }
    
    
}
