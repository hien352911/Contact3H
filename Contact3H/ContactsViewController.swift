//
//  ConTactsTabaleViewController.swift
//  Contact3H
//
//  Created by Hoang on 9/15/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSearchView: UIView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchControler()

    }
    
    func setUpSearchControler() {
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        containerSearchView.addSubview(searchController.searchBar)
    }
}
