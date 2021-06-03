//
//  NewAlarmViewController.swift
//  MidTerm
//
//  Created by Adilzhan Jumakanov on 12.03.2021.
//

import UIKit


protocol AddAlarmDelegate {
    func addAlarm(time: Double, note: String)
}


class NewAlarmViewController: UIViewController {

    
    var delegate: AddAlarmDelegate? 
    
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var noteTextField: UITextField!
    
    
    @IBAction func saveButton(_ sender: Any) {
        guard let del = delegate else {return}
        del.addAlarm(time: timePicker.countDownDuration, note: noteTextField.text ?? "???")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        timePicker.datePickerMode = UIDatePicker.Mode.countDownTimer
        timePicker.countDownDuration = 0
        
        
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
