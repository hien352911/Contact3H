//
//  KeypadViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/22/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class KeyPadViewController: UIViewController {
    
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet var horizontalStackView: [UIStackView]!
    @IBOutlet weak var buttonCustom: UIButton!
    
    @IBOutlet var keyboard: [CustomButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.borderStyle = .none

        verticalStackView.spacing = buttonCustom.bounds.size.width/2
        for stackView in horizontalStackView {
            stackView.spacing = buttonCustom.bounds.width/3
        }
        
        addButton.isHidden = true
        deleteButton.isHidden = true
        textField.delegate = self
        registerNotification()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "keyboardTap"), object: nil, userInfo: ["text" : sender.titleLabel!.text!])
    }
    
    @IBAction func addButton(_ sender: UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: gotoDetailVC))
        alert.addAction(UIAlertAction(title: "Change", style: .default, handler: gotoListContact))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func gotoDetailVC(action: UIAlertAction){
        let storyboard = UIStoryboard(name: "Contacts", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC")
        present(detailVC, animated: true, completion: nil)
    }
    
    func gotoListContact(action: UIAlertAction){
        let storyboard = UIStoryboard(name: "Contacts", bundle: nil)
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC")
        present(contactVC, animated: true, completion: nil)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        textField.text = deleteLastCharacter(textField.text!)
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
            textField.text = textCurrent + stringValue
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
    
    func deleteLastCharacter(_ text: String) -> String {
        var digits = Array(text.characters)
        if textField.text?.characters.count == 1{
            digits.remove(at: 0)
            addButton.isHidden = true
            deleteButton.isHidden = true
        } else {
            digits.remove(at: digits.count - 1)
        }
        return String(digits)
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

