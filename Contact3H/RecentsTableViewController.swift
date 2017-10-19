//
//  RecentsTableViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/24/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class RecentsTableViewController: UITableViewController {
    
    let recentsDataSource = RecentsDataSource()
    let recentsAllDelegate = RecentsAll_Delegate()
    let recentsMissedCallDelegate = RecentsMissedCall_Delegate()
    
    let currentDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = recentsDataSource
        tableView.delegate = recentsAllDelegate
        self.navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DataService.shared.updateHistory()
        tableView.reloadData()
    }
    @IBAction func segmentDidChanged(_ sender: Any) {
        let segment = sender as! UISegmentedControl
        switch segment.selectedSegmentIndex {
        case segmentType.all.rawValue:
            tableView.dataSource = recentsDataSource
            tableView.delegate = recentsAllDelegate
        case segmentType.missedCall.rawValue:
            tableView.dataSource = recentsDataSource
            tableView.delegate = recentsMissedCallDelegate
        default:
            break
        }
        tableView.reloadData()
    }
    
    enum segmentType: Int {
        case all
        case missedCall
    }
}
