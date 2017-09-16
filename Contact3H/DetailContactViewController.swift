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
    
    @IBAction func saveData(_ sender: UIBarButtonItem) {
        switch tabelViewEditingStyle {
        case .insert:
            Database.shared.insertToObjectCoreData(lastName: lastNameTextField.text!)
            navigationController?.popViewController(animated: true)
        default:
            return
        }
    }
}
