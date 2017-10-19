//
//  RecentsCell.swift
//  Contact3H
//
//  Created by Hung Nguyen on 10/1/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class RecentsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var typeOfCallimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        nameLabel.textColor = .black
        statusLabel.textColor = .black
    }
}
