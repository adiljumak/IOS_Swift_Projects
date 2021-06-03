//
//  ViewController.swift
//  Calculator2
//
//  Created by Adilzhan Jumakanov on 07.03.2021.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var myDisplay: UILabel!
    
    var firstTyping = true
    @IBAction func digitPressed(_ sender: UIButton) {
        let currentDigit = sender.currentTitle!
        if !firstTyping{
        
        let currentDisplay = myDisplay.text!
        
        myDisplay.text = currentDisplay + currentDigit
        } else{
            myDisplay.text = currentDigit
            firstTyping = !firstTyping
        }
    }
    
    var displayValue: Double{
        get{
            return Double(myDisplay.text!)!
        }
        set{
            myDisplay.text = String(newValue)
        }
    }
    
    private var model = Model()
    @IBAction func operationPressed(_ sender: UIButton) {
        
        model.setOperand(displayValue)
        model.performOperation(sender.currentTitle!)
        displayValue = model.getResult()
        
        firstTyping = true
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

