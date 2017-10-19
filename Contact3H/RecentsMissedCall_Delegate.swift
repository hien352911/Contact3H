//
//  RecentsMissedCall_Delegate.swift
//  Contact3H
//
//  Created by Hung Nguyen on 10/19/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class RecentsMissedCall_Delegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DataService.shared.histories[indexPath.row].typeOfCall == 2 {
            return 44
        } else {
            return 0
        }
    }
}
