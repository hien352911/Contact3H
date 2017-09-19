//
//  TableViewCell.swift
//  Contact3H
//
//  Created by Hoang on 9/18/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myNumberLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
