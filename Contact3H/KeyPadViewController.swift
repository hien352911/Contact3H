//
//  KeyPadViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/17/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class KeyPadViewController: UIViewController {

    @IBOutlet var deleteButton: UIButton!
    
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    var done = true
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.isHidden = true
        deleteButton.isHidden = true
        textField.delegate = self
        registerNotification()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "keyboardTap"), object: nil, userInfo: ["text" : sender.titleLabel!.text!])
    }

    @IBAction func deleteButton(_ sender: UIButton) {
        deleteCharacter()
    }

    
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyPadTextFieldUpdate), name: NSNotification.Name(rawValue: "keyboardTap"), object: nil)
    }
    
    func keyPadTextFieldUpdate(_ notification : Notification ){
        let dict = notification.userInfo!
        let stringValue = String(describing: dict["text"] ?? "")
        let textCurrent = textField.text!
        switch stringValue {
        case "0" , "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "#":
            if !done {
                textField.text = textCurrent + stringValue
            } else {
                textField.text = stringValue
                done = false
            }
        default:
            return
        }
        checkTextFieldCharacter()
    }
    func checkTextFieldCharacter(){
        if textField.text != ""{
            addButton.isHidden = false
            deleteButton.isHidden = false
        }
    }
    
    func deleteCharacter(){
        textField.text?.characters.dropLast()
    }
}



extension KeyPadViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

}
