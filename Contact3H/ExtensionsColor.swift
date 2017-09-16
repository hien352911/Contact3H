//
//  ExtensionsColor.swift
//  Contact3H
//
//  Created by MTQ on 9/16/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
