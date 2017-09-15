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
        case A = 0, B, C, D, E, F, G, H, I, K, L, M, N, O, P, Q, R, S, T, U, V, X, Y, Z, total
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let realm = try! Realm()
    fileprivate let sectionHeaderHeight: CGFloat = 25
    fileprivate var data = [TableSection: Results<Contact>]()
    fileprivate var listContacts: Int = 0
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dummyData()
        
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
        }
    }
}

// MARK: - UITableViewDataSource

extension ContactsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        return TableSection.total.rawValue + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        if section == 0 {
            listContacts += 1
            return 1
        }
        if let tableSection = TableSection(rawValue: section-1) {
            if let movieData = data[tableSection] {
                listContacts += movieData.count
                return movieData.count
            } else {
                return 0
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure Cell
        if indexPath.section == 0 {
            cell.textLabel?.text = "My Number: +84 166 6894886"
        } else {
            if let tableSection = TableSection(rawValue: indexPath.section-1) {
                if let contact = data[tableSection]?[indexPath.row] {
                    cell.textLabel?.text = contact.firstName
                }
            } else {
                cell.textLabel?.text = "\(listContacts) Contacts"
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
            let movieData = data[tableSection],
                movieData.count > 0 {
            return sectionHeaderHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: sectionHeaderHeight))
        view.backgroundColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.2)
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.bounds.width - 30, height: sectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        
        if let tableSection = TableSection(rawValue: section-1) {
            switch tableSection {
            case .A:
                label.text = "A"
            case .B:
                label.text = "B"
            case .C:
                label.text = "C"
            case .D:
                label.text = "D"
            case .E:
                label.text = "E"
            case .F:
                label.text = "F"
            case .G:
                label.text = "G"
            case .H:
                label.text = "H"
            case .I:
                label.text = "I"
            case .K:
                label.text = "K"
            case .L:
                label.text = "L"
            case .M:
                label.text = "M"
            case .N:
                label.text = "N"
            case .O:
                label.text = "O"
            case .P:
                label.text = "P"
            case .Q:
                label.text = "Q"
            case .R:
                label.text = "R"
            case .S:
                label.text = "S"
            case .T:
                label.text = "T"
            case .U:
                label.text = "U"
            case .V:
                label.text = "V"
            case .X:
                label.text = "X"
            case .Y:
                label.text = "Y"
            case .Z:
                label.text = "Z"
            case .total:
                label.text = ""
            }
        }
        view.addSubview(label)
        return view
    }
}
