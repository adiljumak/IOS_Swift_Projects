//
//  ViewController.swift
//  Drawing
//
//  Created by Adilzhan Jumakanov on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    
    @IBOutlet weak var myView: CustomView!
    
    var carrierState: CarrierState!
    
    @IBAction func saveAction(_ sender: Any) {
        carrierState.savePen()
    }
    
    @IBAction func loadAction(_ sender: Any) {
        carrierState.loadPen()
        carrierState.saveLoadManager.drawPens(in: myView)
    }
    
   
    @IBAction func blackAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func redAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0.995875299, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func orangeAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0.9077877998, green: 0.4970712066, blue: 0, alpha: 1)
    }
    @IBAction func yellowAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0.9163967371, green: 0.9571912885, blue: 0, alpha: 1)
    }
    
    @IBAction func greenAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    @IBAction func blueAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0, green: 0.9720775485, blue: 0.892588973, alpha: 1)
    }
    
    @IBAction func moreBlueAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    
    @IBAction func purpleAction(_ sender: Any) {
        myView.penColor = #colorLiteral(red: 0.7849240899, green: 0, blue: 1, alpha: 1)
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.penColor = UIColor.black
        
        let pens = SaveLoadManager.shared
        carrierState = CarrierState(saveLoadManager: pens)
    }


}

