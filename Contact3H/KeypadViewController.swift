//
//  KeypadViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/22/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class KeyPadViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet var verticalStackView: [UIStackView]!

    @IBOutlet weak var button: CustomButton!
    
    @IBOutlet var keyboard: [CustomButton]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.borderStyle = .none
        
        horizontalStackView.spacing = button.bounds.size.width/2
        for stackView in verticalStackView {
            stackView.spacing = button.bounds.width/3
        }
        
        addButton.isHidden = true
        deleteButton.isHidden = true
        textField.delegate = self
        registerNotification()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for button in keyboard {
            button.layer.cornerRadius = button.bounds.height * 0.5
        }
    }
    
    // MARK: - Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "keyboardTap"), object: nil, userInfo: ["text" : sender.titleLabel!.text!])
    }
    
    @IBAction func addButton(_ sender: UIButton){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: gotoDetailContactViewController))
        alert.addAction(UIAlertAction(title: "Change", style: .default, handler: gotoContactViewController))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func callButton(_ sender: UIButton) {
        let contact = Contact(context: Database.shared.getContext())
        contact.lastName = textField.text
        // get current time
        let date = Date()
        let calender = Calendar.current
        let component = calender.dateComponents([.hour,.minute], from: date)
        let hour = component.hour!
        let minute = component.minute!
        let lastTime = String(describing: hour) + ":" + String(describing: minute)
        
        let typeOfCall = 1
        DataService.shared.addHistory(lastTime: lastTime, typeOfCall: Int16(typeOfCall), contact: contact)
        
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        textField.text = deleteLastCharacter(textField.text!)
    }
    
    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let callVC = segue.destination as? CallViewController {
            callVC.name = textField.text!
        }
    }
    
    func gotoDetailContactViewController(action: UIAlertAction){
        let storyboard = UIStoryboard(name: "Contacts", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailContactViewController
        present(detailVC, animated: true, completion: nil)
    }
    
    func gotoContactViewController(action: UIAlertAction){
        let storyboard = UIStoryboard(name: "Contacts", bundle: nil)
        let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC") as! ContactsViewController
        present(contactVC, animated: true, completion: nil)
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

// MARK: - UITextFieldDelegate
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

