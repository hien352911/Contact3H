//
//  KeyboardCallViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/25/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class KeyboardCallViewController: UIViewController {

    
    // MARK: Outlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var button: CustomButton!
    @IBOutlet var keyboard: [CustomButton]!
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet var verticalStackView: [UIStackView]!
    var name: String?
    var check = true
    
    //MARK: ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        horizontalStackView.spacing = button.bounds.size.width/2
        for stackView in verticalStackView {
            stackView.spacing = button.bounds.width/3
        }
        registerNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = name
        statusLabel.text = "Calling..."
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for button in keyboard {
            button.layer.cornerRadius = button.bounds.height * 0.5
        }
    }
    
    // MARK: Action
    @IBAction func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "keyboardTap"), object: nil, userInfo: ["text" : sender.titleLabel!.text!])
    }
    
    @IBAction func hiddenKeyboardCallViewController(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
        
    @IBAction func EndCall(_ sender: CustomButton) {
        nameLabel.text = name
        statusLabel.text = "Call ended"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: Function
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateNameLabel), name: NSNotification.Name(rawValue: "keyboardTap"), object: nil)
    }
    
    func updateNameLabel(_ notification : Notification ){
        let dict = notification.userInfo!
        let stringValue = String(describing: dict["text"] ?? "")
        let textCurrent = nameLabel.text!
        switch stringValue {
        case "0" , "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "#":
            if !check {
                nameLabel.text = textCurrent + stringValue
            } else {
                nameLabel.text = stringValue
                check = false
            }
        default:
            return
        }
        statusLabel.text = ""
    }
}
