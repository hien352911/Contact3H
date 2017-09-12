//
//  ContactsViewController.swift
//  Contact3H
//
//  Created by MTQ on 9/13/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSearchView: UIView!
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
    }
    
    func setupSearchController()  {
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        containerSearchView.addSubview(searchController.searchBar)
    }

}

// MARK: - UITableViewDataSource

extension ContactsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure Cell
        if indexPath.section == 0 {
            cell.textLabel?.text = "My Number: +84 166 6894886"
        } else {
            cell.textLabel?.text = "Hien"
        }
        return cell
    }
}
