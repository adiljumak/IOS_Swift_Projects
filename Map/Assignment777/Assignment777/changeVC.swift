//
//  changeVC.swift
//  Assignment777
//
//  Created by Adilzhan Jumakanov on 26.03.2021.
//

import UIKit
import MapKit

protocol changeAnnotationDelegate {
    func change(_ annotation: MKAnnotation, _ title: String, _ subtitle: String)
}



class changeVC: UIViewController {
    
    var text1: String?
    var text2: String?
    var annotation: MKAnnotation?
    
    var delegate: changeAnnotationDelegate?
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    
    @IBAction func changeButton(_ sender: UIButton) {
        //annotation?.title = "f"
        //self.annotation?.subtitle = textField2.text
        guard let del = delegate else {
            return
        }
        del.change(annotation!, textField1.text!, textField2.text!)
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.placeholder = text1
        textField2.placeholder = text2
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
