//
//  ViewController.swift
//  Assignment8
//
//  Created by Adilzhan Jumakanov on 01.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    @IBOutlet weak var textField1Outlet: UITextField!
    
    @IBOutlet weak var textField2Outlet: UITextField!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        buttonOutlet.alpha = 0
        
        let screnSize = UIScreen.main.bounds
        let screenWidth = screnSize.width
        let screenHeight = screnSize.height
        
        
        
        self.textField1Outlet.center = CGPoint(x: -1000, y: screenHeight/2 - 50)
        self.textField2Outlet.center = CGPoint(x: 1000, y: screenHeight/2)
        
        
        UIView.animate(withDuration: 2){
            self.buttonOutlet.alpha = 1
            self.buttonOutlet.layer.cornerRadius = 10.0
            self.buttonOutlet.layer.borderWidth = 2
            self.buttonOutlet.layer.borderColor = CGColor.init(red: 255 , green: 255, blue: 255, alpha: 1)
        }
        
        UIView.animate(withDuration: 2){
             self.textField1Outlet.center = CGPoint(x: screenWidth/2, y: screenHeight/2 - 50)
             self.textField2Outlet.center = CGPoint(x: screenWidth/2, y: screenHeight/2 + 15)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1){
            let screnSize = UIScreen.main.bounds
            let screenWidth = screnSize.width
            let screenHeight = screnSize.height
            
             self.textField1Outlet.center = CGPoint(x: screenWidth/2 - 500, y: screenHeight/2 - 50)
             self.textField2Outlet.center = CGPoint(x: screenWidth/2 + 500, y: screenHeight/2 + 15)
        }
    }
    
    


}

