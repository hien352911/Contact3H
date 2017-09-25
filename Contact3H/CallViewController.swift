//
//  CallViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/24/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class CallViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet var keyboard: [CustomButton]!
    
    
    var name : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        statusLabel.text = "Đang gọi ..."
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for button in keyboard {
            button.layer.cornerRadius = button.bounds.height * 0.5
        }
    }
    
    
    @IBAction func EndCall(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
