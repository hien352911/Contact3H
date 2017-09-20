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
    var numBerContact: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dummyData()

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
    
    func isfiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
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
        
        numBerContact += (data[.A]?.count)!
        numBerContact += (data[.B]?.count)!
        numBerContact += (data[.C]?.count)!
        numBerContact += (data[.D]?.count)!
        numBerContact += (data[.E]?.count)!
        numBerContact += (data[.F]?.count)!
        numBerContact += (data[.G]?.count)!
        numBerContact += (data[.H]?.count)!
        numBerContact += (data[.I]?.count)!
        numBerContact += (data[.J]?.count)!
        numBerContact += (data[.K]?.count)!
        numBerContact += (data[.L]?.count)!
        numBerContact += (data[.M]?.count)!
        numBerContact += (data[.N]?.count)!
        numBerContact += (data[.O]?.count)!
        numBerContact += (data[.P]?.count)!
        numBerContact += (data[.Q]?.count)!
        numBerContact += (data[.R]?.count)!
        numBerContact += (data[.S]?.count)!
        numBerContact += (data[.T]?.count)!
        numBerContact += (data[.U]?.count)!
        numBerContact += (data[.V]?.count)!
        numBerContact += (data[.W]?.count)!
        numBerContact += (data[.X]?.count)!
        numBerContact += (data[.Y]?.count)!
        numBerContact += (data[.Z]?.count)!
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
        Database.shared.insertToObjectCoreData(lastName: "Gấm", nameSection: "G")
        Database.shared.insertToObjectCoreData(lastName: "Giang", nameSection: "G")
        Database.shared.insertToObjectCoreData(lastName: "Hoang", nameSection: "H")
        Database.shared.insertToObjectCoreData(lastName: "Hien", nameSection: "H")
        Database.shared.insertToObjectCoreData(lastName: "Kien", nameSection: "K")
        Database.shared.insertToObjectCoreData(lastName: "Lam", nameSection: "L")
        Database.shared.insertToObjectCoreData(lastName: "Long", nameSection: "L")
        Database.shared.insertToObjectCoreData(lastName: "Mai", nameSection: "M")
        Database.shared.insertToObjectCoreData(lastName: "Minh", nameSection: "M")
        Database.shared.insertToObjectCoreData(lastName: "Ngan", nameSection: "N")
        Database.shared.insertToObjectCoreData(lastName: "Nga", nameSection: "N")
        Database.shared.insertToObjectCoreData(lastName: "Oanh", nameSection: "O")
        Database.shared.insertToObjectCoreData(lastName: "Ong", nameSection: "O")
        Database.shared.insertToObjectCoreData(lastName: "Phi", nameSection: "P")
        Database.shared.insertToObjectCoreData(lastName: "Phong", nameSection: "P")
        Database.shared.insertToObjectCoreData(lastName: "Ring", nameSection: "R")
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
        return TableSection.total.rawValue + 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == TableSection.total.rawValue + 1 {
            return 1
        }
        if let tableSection = TableSection(rawValue: section - 1) {
            if let contactData = data[tableSection] {
                return contactData.count
            } else {
                return 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tableSection = TableSection(rawValue: section - 1) {
            if let contactData = data[tableSection],
                contactData.count > 0 {
                return sectionHeaderHeight
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        if let tableSection = TableSection(rawValue: section - 1) {
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
        
        // contact:
        
        if indexPath.section == TableSection.total.rawValue + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyNumberContactCell", for: indexPath) as! ContactsTableViewCell
            cell.myNumberLabel.text = "\(numBerContact) Contacts"
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "My Number: +8412345678"
        } else {
            if let tableSection = TableSection(rawValue: indexPath.section-1) {
                if let contacts = data[tableSection]?[indexPath.row] {
                    cell.textLabel?.text = contacts.lastName
                }
            }
        }
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"]
    }
}
