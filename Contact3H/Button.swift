//
//  Button.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/17/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {
    
    @IBInspectable
    var borderWidth : Float = 0 {
        didSet {
            self.layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable
    var cornerRadius : CGFloat = 0 {
        didSet {
            if cornerRadius == -1 {
                self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            } else {
                self.layer.cornerRadius = cornerRadius
            }
            self.clipsToBounds = true
        }
    }
}
