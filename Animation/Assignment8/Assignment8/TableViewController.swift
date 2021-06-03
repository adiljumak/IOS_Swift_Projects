//
//  TableViewController.swift
//  Assignment8
//
//  Created by Adilzhan Jumakanov on 02.04.2021.
//

import UIKit

class TableViewController: UITableViewController {

    
    //@IBOutlet weak var myButtonButton: UIButton!
    var phones = [Phone.init(name: "Iphone 7 Plus", price: 350, CPUname: "A10 Fusion", camera: "12MPX"),
              Phone.init(name: "Samsung Galaxy S8", price: 500, CPUname: "Snapdragon 835", camera: "12MPX"),
              Phone.init(name: "LG G4", price: 400, CPUname: "Snapdragon 808", camera: "16MPX")]
    
    var isFlipped = false
    
    //@IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.myButtonButton.layer.cornerRadius = 10.0
//        self.myButtonButton.layer.borderWidth = 2
//        self.myButtonButton.layer.borderColor = CGColor.init(red: 0 , green: 0, blue: 0, alpha: 1)
        //myView.alpha = 0

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            self?.view.transform = CGAffineTransform.identity
        })
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return phones.count
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell){
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            return
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        CustomCell.index = indexPath.row
        
        print(indexPath.row)
        
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? CustomCell
        
        cell?.name.text = phones[indexPath.row].name
        cell?.price.text = String(phones[indexPath.row].price!) + "$"
        //cell?.newView.alpha = 0
        
        // Configure the cell...
        cell?.CellmyCell.layer.cornerRadius = 10
        
        cell?.CellmyCell.layer.borderWidth = 2
        cell?.CellmyCell.layer.borderColor = CGColor.init(red: 0 , green: 0, blue: 0, alpha: 1)
        return cell!
    }
    
    
   
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
       
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
