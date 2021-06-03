//
//  DetailViewController.swift
//  ContactBook2
//
//  Created by Adilzhan Jumakanov on 08.03.2021.
//

import UIKit

protocol DeleteProtocol {
    func deleteStudentByIndex(at index: Int)
}


class DetailViewController: UIViewController {


    
    var delegate: DeleteProtocol?
    
    
    
    
    var prevVC: ViewController?
    
    var name: String?
    var gpaVar: String?
    var imageVar: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var gpaLabel: UILabel!
    var index: Int?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func closePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        //prevVC?.addContactHelloPrintJust()
        delegate?.deleteStudentByIndex(at: index ?? 0)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        gpaLabel.text = gpaVar
        imageView.image = imageVar
        
        
        
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
