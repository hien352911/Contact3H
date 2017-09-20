//
//  ConTactsTabaleViewController.swift
//  Contact3H
//
//  Created by Hoang on 9/15/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit
import CoreData

class ContactsViewController: UIViewController {
    
    var contacts: [Contact] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSearchView: UIView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // 26 characters
    enum TableSection: Int {
        case A = 0, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, total
    }
    
    let sectionHeaderHeight: CGFloat = 25
    
    var data = [TableSection: [Contact]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dummyData()

        setUpSearchControler()
        sortData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataFromcoreData()
    }
    
    func setUpSearchControler() {
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        containerSearchView.addSubview(searchController.searchBar)
    }
    
    func sortData() {
        let managedObjectContext = Database.shared.getContext()
        
        data[.A] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "A"
        })
        data[.B] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "B"
        })
        data[.C] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "C"
        })
        data[.D] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "D"
        })
        data[.E] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "E"
        })
        data[.F] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "F"
        })
        data[.G] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "G"
        })
        data[.H] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "H"
        })
        data[.I] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "I"
        })
        data[.J] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "J"
        })
        data[.K] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "K"
        })
        data[.L] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "L"
        })
        data[.M] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "M"
        })
        data[.N] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "N"
        })
        data[.O] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "O"
        })
        data[.P] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "P"
        })
        data[.Q] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "Q"
        })
        data[.R] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "R"
        })
        data[.S] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "S"
        })
        data[.T] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "T"
        })
        data[.U] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "U"
        })
        data[.V] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "V"
        })
        data[.W] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "W"
        })
        data[.X] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "X"
        })
        data[.Y] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "Y"
        })
        data[.Z] = try! managedObjectContext.fetch(Contact.fetchRequest()).filter({ (contact) -> Bool in
            return contact.nameSections == "Z"
        })
    }
    
    func dummyData() {
        Database.shared.insertToObjectCoreData(lastName: "Anh Dung", nameSection: "A")
        Database.shared.insertToObjectCoreData(lastName: "Anh Trung", nameSection: "A")
        Database.shared.insertToObjectCoreData(lastName: "Anh Hung", nameSection: "A")
        Database.shared.insertToObjectCoreData(lastName: "Bac Chu", nameSection: "B")
        Database.shared.insertToObjectCoreData(lastName: "Bac Nam", nameSection: "B")
        Database.shared.insertToObjectCoreData(lastName: "Chau Gai", nameSection: "C")
        Database.shared.insertToObjectCoreData(lastName: "Chau Trai", nameSection: "C")
        Database.shared.insertToObjectCoreData(lastName: "Duong", nameSection: "D")
        Database.shared.insertToObjectCoreData(lastName: "Em Ruot", nameSection: "E")
        Database.shared.insertToObjectCoreData(lastName: "Em Re", nameSection: "E")
        Database.shared.insertToObjectCoreData(lastName: "Hoang", nameSection: "H")
        Database.shared.insertToObjectCoreData(lastName: "Hien", nameSection: "H")
        Database.shared.insertToObjectCoreData(lastName: "Kien", nameSection: "K")
        Database.shared.insertToObjectCoreData(lastName: "Lam", nameSection: "L")
        Database.shared.insertToObjectCoreData(lastName: "Long", nameSection: "L")
        Database.shared.insertToObjectCoreData(lastName: "Mai", nameSection: "M")
        Database.shared.insertToObjectCoreData(lastName: "Minh", nameSection: "M")
        Database.shared.insertToObjectCoreData(lastName: "Ngan", nameSection: "N")
        Database.shared.insertToObjectCoreData(lastName: "Nga", nameSection: "N")
        Database.shared.insertToObjectCoreData(lastName: "Phi", nameSection: "P")
        Database.shared.insertToObjectCoreData(lastName: "Phong", nameSection: "P")
        Database.shared.insertToObjectCoreData(lastName: "Quang", nameSection: "Q")
        Database.shared.insertToObjectCoreData(lastName: "Son", nameSection: "S")
        Database.shared.insertToObjectCoreData(lastName: "Yen", nameSection: "Y")
    }
    
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
        Database.shared.insertToObjectCoreData(lastName: detailContactViewController.lastNameTextField.text!, nameSection: "")
        
        fetchDataFromcoreData()
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.total.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableSection = TableSection(rawValue: section), let contacData = data[tableSection] {
            return contacData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tableSection = TableSection(rawValue: section), let contacData = data[tableSection], contacData.count > 0 {
            return sectionHeaderHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let tableSection = TableSection(rawValue: section) {
                        switch tableSection {
                        case .A:
                            return "A"
                        case .B:
                            return "B"
                        case .C:
                            return "C"
                        case .D:
                            return "D"
                        case .E:
                            return "E"
                        case .F:
                            return "F"
                        case .G:
                            return "G"
                        case .H:
                            return "H"
                        case .I:
                            return "I"
                        case .J:
                            return "J"
                        case .K:
                            return "K"
                        case .L:
                            return "L"
                        case .M:
                            return "M"
                        case .N:
                            return "N"
                        case .O:
                            return "O"
                        case .P:
                            return "P"
                        case .Q:
                            return "Q"
                        case .R:
                            return "R"
                        case .S:
                            return "S"
                        case .T:
                            return "T"
                        case .U:
                            return "U"
                        case .V:
                            return "V"
                        case .W:
                            return "W"
                        case .X:
                            return "X"
                        case .Y:
                            return "Y"
                        case .Z:
                            return "Z"
                        default:
                            return ""
                        }
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let tableSection = TableSection(rawValue: indexPath.section), let contact = data[tableSection]?[indexPath.row] {
            cell.textLabel?.text = contact.lastName
        }
        return cell
    }
}
