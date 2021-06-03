//
//  EditAlarmViewController.swift
//  MidTerm
//
//  Created by Adilzhan Jumakanov on 12.03.2021.
//

import UIKit



protocol deleteAlarmDelegate {
    func deleteAlarm(index: Int)
}

protocol changeAlarmDelegate {
    func changeAlarm(index: Int, seconds: Double, noteEditTextField: String)
}


class EditAlarmViewController: UIViewController {
    
     
    
    @IBOutlet weak var noteEditTextField: UITextField!
    
    
    var index: Int?

    @IBOutlet weak var timePicker: UIDatePicker!

    var deleteDelegate: deleteAlarmDelegate?
    var changeDelegate: changeAlarmDelegate?
    
    
    @IBAction func deleteButton(_ sender: Any) {
        guard let del = deleteDelegate else {return}
        del.deleteAlarm(index: index!)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func changeButton(_ sender: Any) {
        guard let del = changeDelegate else {return}
        del.changeAlarm(index: index!, seconds: timePicker.countDownDuration, noteEditTextField: noteEditTextField.text ?? "???")
        navigationController?.popViewController(animated: true)
    }
    
    var seconds: String?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        timePicker.datePickerMode = UIDatePicker.Mode.countDownTimer
        print(seconds!)
        
        var components = seconds?.components(separatedBy: ":")
        let hour = Double(components![0])!*60*60
        let minute = Double(components![1])!*60
        let ans = hour + minute
        timePicker.countDownDuration = ans

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
