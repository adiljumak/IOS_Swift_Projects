//
//  ViewController.swift
//  ContactBook2
//
//  Created by Adilzhan Jumakanov on 07.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddVCDelegate, DeleteProtocol{
    func deleteStudentByIndex(at index: Int) {
        students.remove(at: index)
        myTableView.reloadData()
    }
    func addNewContact(name: String, gpa: String, gender: String) {
        students.append(Student(name, gpa, gender.elementsEqual("male") ? UIImage.init(named: "male")! : UIImage.init(named: "female")!))
        myTableView.reloadData()
    }
    
    
    
    var students = [Student.init("Wasya Pupkin", "3.4", UIImage.init(named: "male")!),
                    Student.init("Ya oumau", "4.0", UIImage.init(named: "male")!)]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomTableViewCell
        
        cell?.studentName.text = students[indexPath.row].nameAndSurname
        cell?.studentGPA.text = students[indexPath.row].gpa
        cell?.studentImageView.image = students[indexPath.row].image
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // myTableView.deselectRow(at: indexPath, animated: true)
        
//        let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
//
//        navigationController?.pushViewController(detailVC!, animated: true )
        
        
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if (editingStyle == .delete){
            students.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let index = (myTableView.indexPathForSelectedRow?.row)! // тут я перед тем как открыть
//        let destination = segue.destination as! DetailViewController // новое view я передаю ему его поле name
//        destination.name = students[index].nameAndSurname!
        
//        if let dest = segue.destination as? DetailViewController{
//            dest.prevVC = self
//        }
        
        
        let index = (myTableView.indexPathForSelectedRow?.row)!
        let destination = segue.destination as! DetailViewController
        destination.name = students[index].nameAndSurname!
        destination.gpaVar = students[index].gpa!
        destination.imageVar = students[index].image!
        destination.delegate = self
        destination.index = index 
        
        
        
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard?.instantiateViewController(withIdentifier: "addVC" ) as? AddVC
        newVC?.delegate = self
        self.navigationController?.pushViewController(newVC!, animated: true)
    }
    
    
    
//    func addContactHelloPrintJust(){
//        print("hello")
//        students[0].nameAndSurname = "changed"
//        print(students[0].nameAndSurname ?? "None")
//        myTableView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   

}

//extension ViewController : AddVCDelegate {
//    myTableView.reloadData()
//
//
//
//}

