//
//  TextField.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/17/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

@IBDesignable

class TextField: UITextField {
    
    @IBInspectable
    var borderColor : UIColor = .black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
