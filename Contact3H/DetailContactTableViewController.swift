//
//  DetailContactTableViewController.swift
//  Contact3H
//
//  Created by Hoang on 9/22/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

enum CellIndex: Int {
    case row0
    case row1
    case row2
    case row3
    case row4
    case row5
    case row6
    case row7
    case row8
    case row9
    case row10
    case row11
    case row12
    case rowDefault
}

class DetailContactTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case CellIndex.row0.rawValue:
            return 140
        case CellIndex.row12.rawValue:
            return 130
        case CellIndex.row1.rawValue:
            return 80
        default:
            return 100
        }
    }
}
