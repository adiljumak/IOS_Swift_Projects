//
//  AddVC.swift
//  ContactBook2
//
//  Created by Adilzhan Jumakanov on 23.04.2021.
//

import UIKit

protocol AddVCDelegate {
    func addNewContact(name:String, gpa:String, gender: String)
}


class AddVC: UIViewController {

    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var genderPickerView: UIPickerView!
    
    var delegate: AddVCDelegate?
    
    let genders = ["male", "female"]
    var gender:String = "male"
    override func viewDidLoad() {
        super.viewDidLoad()
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let del = delegate else {
            return
        }
        del.addNewContact(name: textField1.text!, gpa: textField2.text!, gender: gender)
        navigationController?.popViewController(animated: true)
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
extension AddVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender = genders[row]
        print(gender)
    }
    
}
