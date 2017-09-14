//
//  TabBarController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/14/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = UserDefaults.standard.integer(forKey: "tabBarIndex")
        self.delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBatIndex = tabBarController.selectedIndex.hashValue
        UserDefaults.standard.set(tabBatIndex, forKey: "tabBarIndex")
    }
}

