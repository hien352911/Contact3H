//
//  ConTactsTabaleViewController.swift
//  Contact3H
//
//  Created by Hoang on 9/15/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit
import CoreData

//let ContactsData = [
//    ["title": "Anh", "genre": "a"],
//    ["title": "Bình", "genre": "b"],
//    ["title": "Chung", "genre": "c"],
//    ["title": "Dũng", "genre": "d"],
//    ["title": "Em", "genre": "e"],
//    ["title": "Gấm", "genre": "g"]
//    
//]

class ContactsViewController: UIViewController {
    
    var contacts: [Contact] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSearchView: UIView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    enum TableSection: Int {
        case a = 0, b, c, d, e, f, g, h, total
    }
    
    let SectionHeaderHeight: CGFloat = 25
    
    var data = [TableSection: [[String: String]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sortData()
        setUpSearchControler()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataFromcoreData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func setUpSearchControler() {
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        containerSearchView.addSubview(searchController.searchBar)
    }
    
//    func sortData() {
//        data[.a] = ContactsData.filter({ $0["genre"] == "a" })
//        data[.b] = ContactsData.filter({ $0["genre"] == "b" })
//        data[.c] = ContactsData.filter({ $0["genre"] == "c" })
//        data[.d] = ContactsData.filter({ $0["genre"] == "d" })
//        data[.e] = ContactsData.filter({ $0["genre"] == "e" })
//        data[.g] = ContactsData.filter({ $0["genre"] == "g" })
//    }
    
    func fetchDataFromcoreData() {
        let managedObjectContext = Database.shared.getContext()
        contacts = try! managedObjectContext.fetch(Contact.fetchRequest()) as! [Contact]
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailContactViewController else {return}
        if segue.identifier == "insert" {
            detailViewController.tabelViewEditingStyle = .insert
        }
    }
    
    // MARK: - Segue
    
    @IBAction func unwinFromDetailContactViewControlllerToContactsViewController(_ segue: UIStoryboardSegue) {
        guard let detailContactViewController = segue.source as? DetailContactViewController else { return }
        Database.shared.insertToObjectCoreData(lastName: detailContactViewController.lastNameTextField.text!)
        
        fetchDataFromcoreData()
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
////        return TableSection.total.rawValue
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let tableSection = TableSection(rawValue: section), let contacData = data[tableSection] {
//            return contacData.count
//        }
//        return 0
        return contacts.count
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        if let tableSection = TableSection(rawValue: section), let contacData = data[tableSection], contacData.count > 0 {
////            return SectionHeaderHeight
////        }
////        return 0
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
//        view.backgroundColor = UIColor.lightGray
//        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//        label.textColor = UIColor.black
//        if let tableSection = TableSection(rawValue: section) {
//            switch tableSection {
//            case .a:
//                label.text = "A"
//            case .b:
//                label.text = "B"
//            case .c:
//                label.text = "C"
//            case .d:
//                label.text = "D"
//            case .e:
//                label.text = "E"
//            case .g:
//                label.text = "G"
//            default:
//                label.text = ""
//            }
//        }
//        view.addSubview(label)
//        return view
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        if let tableSection = TableSection(rawValue: indexPath.section), let movie = data[tableSection]?[indexPath.row] {
//            cell.textLabel?.text = movie["title"]
//        }
            cell.textLabel?.text = contacts[indexPath.row].lastName
        return cell
    }
}
