//
//  ViewController.swift
//  MidTerm
//
//  Created by Adilzhan Jumakanov on 12.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, deleteAlarmDelegate, changeAlarmDelegate, AddAlarmDelegate {
    func addAlarm(time: Double, note: String) {
        let hours = Int(time / (60*60) )
        let minutes = Int(time / 60 ) - 60*hours
        
        let ans = String(hours) + ":" + String(minutes)
        
        
        alarms.append(Alarm.init(ans, false, note))
        
        myTableView.reloadData()
    }
    
    func deleteAlarm(index: Int) {
        alarms.remove(at: index)
        myTableView.reloadData()
    }
    
    func changeAlarm(index: Int, seconds: Double, noteEditTextField: String) {
        alarms[index].note = noteEditTextField
        let hours = Int(seconds / (60*60) )
        let minutes = Int(seconds / 60 ) - 60*hours
        
        let ans = String(hours) + ":" + String(minutes)
        
        alarms[index].time = ans
        myTableView.reloadData()
        
    }
    
    
    
  
    
    
    var alarms = [Alarm.init("11:30", false, "11"), Alarm.init("15:00", true, "Something")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell
        
        cell?.timeLabel.text = alarms[indexPath.row].time
        cell?.noteLabel.text = alarms[indexPath.row].note
        cell?.activeSwitch.isOn = alarms[indexPath.row].active!
        
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let editVC = self.storyboard?.instantiateViewController(identifier: "editVC") as! EditAlarmViewController
        
        
        //print(alarms[indexPath.row].time!)
        editVC.seconds = alarms[indexPath.row].time
        editVC.index = indexPath.row
        
        editVC.deleteDelegate = self
        editVC.changeDelegate = self
        
        
        navigationController?.pushViewController(editVC, animated: true)
        
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
            
        }
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    @IBAction func activeSwitch(_ sender: UISwitch) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell){
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            return
        }
        guard let indexPath = myTableView.indexPath(for: cell) else {
            return
        }
        alarms[indexPath.row].active = !(alarms[indexPath.row].active ?? false)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! NewAlarmViewController
        destination.delegate = self
    }
    
    
    
    
    
    


}

