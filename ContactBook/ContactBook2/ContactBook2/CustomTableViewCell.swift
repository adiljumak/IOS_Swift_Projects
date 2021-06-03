//
//  CustomTableViewCell.swift
//  ContactBook2
//
//  Created by Adilzhan Jumakanov on 08.03.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentGPA: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
