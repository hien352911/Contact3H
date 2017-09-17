//
//  ContactsViewController.swift
//  Contact3H
//
//  Created by MTQ on 9/13/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit
import RealmSwift

class ContactsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSearchView: UIView!
    
    // MARK: - Properties
    
    enum TableSection: Int {
        case A = 0, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, X, Y, Z, total
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let realm = try! Realm()
    fileprivate let sectionHeaderHeight: CGFloat = 25
    fileprivate var data = [TableSection: Results<Contact>]()
    fileprivate var numberContact: Int = 0
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dummyData()
        
        setupSearchController()
    
        sortData()
    }
    
    // MARK: - Methods
    
    func sortData() {
        data[.A] = realm.objects(Contact.self).filter("sectionName == %@", "A")
        data[.B] = realm.objects(Contact.self).filter("sectionName == %@", "B")
        data[.C] = realm.objects(Contact.self).filter("sectionName == %@", "C")
        data[.D] = realm.objects(Contact.self).filter("sectionName == %@", "D")
        data[.E] = realm.objects(Contact.self).filter("sectionName == %@", "E")
        data[.F] = realm.objects(Contact.self).filter("sectionName == %@", "F")
        data[.G] = realm.objects(Contact.self).filter("sectionName == %@", "G")
        data[.H] = realm.objects(Contact.self).filter("sectionName == %@", "H")
        data[.I] = realm.objects(Contact.self).filter("sectionName == %@", "I")
        data[.J] = realm.objects(Contact.self).filter("sectionName == %@", "J")
        data[.K] = realm.objects(Contact.self).filter("sectionName == %@", "K")
        data[.L] = realm.objects(Contact.self).filter("sectionName == %@", "L")
        data[.M] = realm.objects(Contact.self).filter("sectionName == %@", "M")
        data[.N] = realm.objects(Contact.self).filter("sectionName == %@", "N")
        data[.O] = realm.objects(Contact.self).filter("sectionName == %@", "O")
        data[.P] = realm.objects(Contact.self).filter("sectionName == %@", "P")
        data[.Q] = realm.objects(Contact.self).filter("sectionName == %@", "Q")
        data[.R] = realm.objects(Contact.self).filter("sectionName == %@", "R")
        data[.S] = realm.objects(Contact.self).filter("sectionName == %@", "S")
        data[.T] = realm.objects(Contact.self).filter("sectionName == %@", "T")
        data[.U] = realm.objects(Contact.self).filter("sectionName == %@", "U")
        data[.V] = realm.objects(Contact.self).filter("sectionName == %@", "V")
        data[.X] = realm.objects(Contact.self).filter("sectionName == %@", "X")
        data[.Y] = realm.objects(Contact.self).filter("sectionName == %@", "Y")
        data[.Z] = realm.objects(Contact.self).filter("sectionName == %@", "Z")
        
        numberContact += data[.A]!.count
        numberContact += data[.B]!.count
        numberContact += data[.C]!.count
        numberContact += data[.D]!.count
        numberContact += data[.E]!.count
        numberContact += data[.F]!.count
        numberContact += data[.G]!.count
        numberContact += data[.H]!.count
        numberContact += data[.I]!.count
        numberContact += data[.J]!.count
        numberContact += data[.K]!.count
        numberContact += data[.L]!.count
        numberContact += data[.M]!.count
        numberContact += data[.N]!.count
        numberContact += data[.O]!.count
        numberContact += data[.P]!.count
        numberContact += data[.Q]!.count
        numberContact += data[.R]!.count
        numberContact += data[.S]!.count
        numberContact += data[.T]!.count
        numberContact += data[.U]!.count
        numberContact += data[.V]!.count
        numberContact += data[.X]!.count
        numberContact += data[.Y]!.count
        numberContact += data[.Z]!.count
    }
    
    func setupSearchController()  {
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        containerSearchView.addSubview(searchController.searchBar)
    }
    
    func dummyData() {
        let contact1 = Contact()
        contact1.firstName = "Anh Anh"
        contact1.sectionName = "A"
        let contact2 = Contact()
        contact2.firstName = "Anh Cường"
        contact2.sectionName = "A"
        let contact3 = Contact()
        contact3.firstName = "Anh Đức"
        contact3.sectionName = "A"
        let contact4 = Contact()
        contact4.firstName = "Anh Việt"
        contact4.sectionName = "A"
        let contact5 = Contact()
        contact5.firstName = "Cháu Gái"
        contact5.sectionName = "C"
        let contact6 = Contact()
        contact6.firstName = "Cháu Trai"
        contact6.sectionName = "C"
        let contact7 = Contact()
        contact7.firstName = "Chị Họ"
        contact7.sectionName = "C"
        let contact8 = Contact()
        contact8.firstName = "Em Gái"
        contact8.sectionName = "E"
        let contact9 = Contact()
        contact9.firstName = "Em Họ (M)"
        contact9.sectionName = "E"
        let contact10 = Contact()
        contact10.firstName = "Gà Fifa"
        contact10.sectionName = "G"
        let contact11 = Contact()
        contact11.firstName = "Hằng"
        contact11.sectionName = "H"
        let contact12 = Contact()
        contact12.firstName = "Huy Sự"
        contact12.sectionName = "H"
        let contact13 = Contact()
        contact13.firstName = "K Bi"
        contact13.sectionName = "K"
        let contact14 = Contact()
        contact14.firstName = "Nam Tào"
        contact14.sectionName = "N"
        let contact15 = Contact()
        contact15.firstName = "Phương"
        contact15.sectionName = "P"
        let contact16 = Contact()
        contact16.firstName = "Thắng Quán"
        contact16.sectionName = "T"
        let contact17 = Contact()
        contact17.firstName = "Tuấn"
        contact17.sectionName = "T"
        let contact18 = Contact()
        contact18.firstName = "U Ta Chi"
        contact18.sectionName = "U"
        let contact19 = Contact()
        contact19.firstName = "Anh Hoàng"
        contact19.sectionName = "A"
        let contact20 = Contact()
        contact20.firstName = "Bác Chủ"
        contact20.sectionName = "B"
        let contact21 = Contact()
        contact21.firstName = "Dương"
        contact21.sectionName = "D"
        
        try! realm.write {
            realm.add(contact1)
            realm.add(contact2)
            realm.add(contact3)
            realm.add(contact4)
            realm.add(contact5)
            realm.add(contact6)
            realm.add(contact7)
            realm.add(contact8)
            realm.add(contact9)
            realm.add(contact10)
            realm.add(contact11)
            realm.add(contact12)
            realm.add(contact13)
            realm.add(contact14)
            realm.add(contact15)
            realm.add(contact16)
            realm.add(contact17)
            realm.add(contact18)
            realm.add(contact19)
            realm.add(contact20)
            realm.add(contact21)
        }
    }
}

// MARK: - UITableViewDataSource

extension ContactsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.total.rawValue + 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // My Number: .....
        if section == 0 {
            return 1
        }
        // ... Contacts
        if section == TableSection.total.rawValue + 1 {
            return 1
        }
        
        if let tableSection = TableSection(rawValue: section-1) {
            if let contactData = data[tableSection] {
                return contactData.count
            } else {
                return 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ... Contacts
        if indexPath.section == TableSection.total.rawValue + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
            cell.numberContactLabel?.text = "\(numberContact) Contacts"
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure Cell
        // My Number: .....
        if indexPath.section == 0 {
            cell.textLabel?.text = "My Number: +84 166 6894886"
        } else {
            if let tableSection = TableSection(rawValue: indexPath.section-1) {
                if let contact = data[tableSection]?[indexPath.row] {
                    cell.textLabel?.text = contact.firstName
                }
            }
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tableSection = TableSection(rawValue: section-1),
            let contactData = data[tableSection],
                contactData.count > 0 {
            return sectionHeaderHeight
        }
        return 0
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        }
        if let tableSection = TableSection(rawValue: section-1) {
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
            case .X:
                return "X"
            case .Y:
                return "Y"
            case .Z:
                return "Z"
            case .total:
                return ""
            }
        }
        return nil
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "Z", "#"]
    }
}
