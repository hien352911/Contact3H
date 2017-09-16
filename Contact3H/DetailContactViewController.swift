//
//  DetailContactViewController.swift
//  Contact3H
//
//  Created by Hoang on 9/15/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit
import CoreData

enum TabelViewEditingStyle {
    case insert
    case edit
}

class DetailContactViewController: UIViewController {

    @IBOutlet weak var lastNameTextField: UITextField!
    
    var lastName: String?
    var tabelViewEditingStyle: TabelViewEditingStyle = .insert
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let lastName = lastName else {return}
        lastNameTextField.text = lastName
    }
    
    @IBAction func saveToData(_ sender: UIBarButtonItem) {
        if lastNameTextField.text! == "" {
            let alertController = UIAlertController(title: "Thong bao", message: "Ban can nhap ten", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "unwinFromDetailContactViewControlllerToContactsViewController", sender: self)
        }
    }
}
