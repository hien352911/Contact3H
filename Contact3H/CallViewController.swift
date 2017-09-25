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
        statusLabel.text = "Calling..."
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for button in keyboard {
            button.layer.cornerRadius = button.bounds.height * 0.5
        }
    }

    
    @IBAction func EndCall(_ sender: UIButton) {
        statusLabel.text = "Call ended"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let keyboardCallVC = segue.destination as? KeyboardCallViewController {
            keyboardCallVC.name = nameLabel.text
        }
    }
}
