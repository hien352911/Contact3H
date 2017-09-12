//
//  ViewController.swift
//  Contact3H
//
//  Created by MTQ on 9/10/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let tabBarIndex = UserDefaults.standard.integer(forKey: UserDefaultKey.selectingTabBarIndex)
        self.selectedIndex = tabBarIndex
    }
}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        UserDefaults.standard.setValue(tabBarIndex, forKey: UserDefaultKey.selectingTabBarIndex)
    }
}

