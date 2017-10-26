//
//  RecentsTableViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/24/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class RecentsTableViewController: UITableViewController {
    
    @IBOutlet weak var deleteButton: UIButton!
    
    let recentsDataSource = RecentsDataSource()
    let recentsAllDelegate = RecentsAll_Delegate()
    let recentsMissedCallDelegate = RecentsMissedCall_Delegate()
    
    let currentDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = recentsDataSource
        tableView.delegate = recentsAllDelegate
        self.navigationItem.rightBarButtonItem = editButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name(rawValue: "reloadTableView"), object: nil)
        deleteButton.isHidden = true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        if editing{
            deleteButton.isHidden = false
        } else {
            deleteButton.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DataService.shared.updateHistory()
        tableView.reloadData()
    }
    
    func reloadTableView(){
        DataService.shared.updateHistory()
        tableView.reloadData()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Delete All", style: .default, handler: DataService.shared.deleteAllRecents))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
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
