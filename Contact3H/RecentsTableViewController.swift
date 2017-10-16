//
//  RecentsTableViewController.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/24/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class RecentsTableViewController: UITableViewController {

    
    let currentDate = Date(timeIntervalSince1970: Date().timeIntervalSince1970)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DataService.shared.updateHistory()
        tableView.reloadData()
    }
    
    func setupLastTime(time: TimeInterval)-> String?{
        
        let date = Date(timeIntervalSince1970: time)
        let calender = Calendar.current.dateComponents([.day, .month, .year, .hour,.minute,.weekday], from: date)
        let day = calender.day!
        let month = calender.month!
        let year = calender.year!
        let hour = calender.hour!
        let minute = calender.minute!
        
        let date1 = Calendar.current.startOfDay(for: date)
        let date2 = Calendar.current.startOfDay(for: currentDate)
        
        let component = Calendar.current.dateComponents([.day], from: date1, to: date2)
        
        if component.day == 0 {
            return String(format: "%02d:%02d", hour, minute)
        }
        else if component.day == 1 {
            return "Yesterday"
        }
        else if component.day! > 1 && component.day!<=7{
            return getWeekDay(timeInterval: time)
        }
        else {
            return String(format: "%02d/%02d/%04d", day, month, year)
        }
    }
    
    func getWeekDay(timeInterval: TimeInterval) -> String{
        let dateFormatter = DateFormatter()
        let thatDay = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.locale = Locale(identifier: "VI")
        let orderedDay = Calendar.current.component(.weekday, from: thatDay) - 1
        let weekDay = dateFormatter.weekdaySymbols[orderedDay]
        return weekDay
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.histories.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecentsCell
        cell.nameLabel.text = DataService.shared.histories[indexPath.row].contact?.lastName
        cell.statusLabel.text = "không xác định"
        cell.lastTimeLabel.text = setupLastTime(time: DataService.shared.histories[indexPath.row].lastTime)
        
        if DataService.shared.histories[indexPath.row].typeOfCall == 0 {
            cell.typeOfCallimage.image = #imageLiteral(resourceName: "CallTo")
        } else if DataService.shared.histories[indexPath.row].typeOfCall == 1{
            cell.typeOfCallimage.image = #imageLiteral(resourceName: "IncomingCall")
        } else {
            cell.typeOfCallimage.image = #imageLiteral(resourceName: "MissedCall")
            cell.nameLabel.textColor = .red
            cell.statusLabel.textColor = .red
        }
        return cell
    }
}
