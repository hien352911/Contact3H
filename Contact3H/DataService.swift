//
//  DataService.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/24/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import Foundation
import CoreData

class DataService {
    static let shared: DataService = DataService()
    private init() {}
    private let context = Database.shared.getContext()
    private var _histories : [History]?
    private var _historiesForMissedCall : [History]?
    
    var histories : [History]!
    var historiesForMissedCall : [History]!
    func updateHistory() {
        _histories = try! context.fetch(History.fetchRequest())
        histories = _histories?.reversed()
    }

    func addHistory(lastTime: TimeInterval, typeOfCall: Int16, contact: Contact){
        let history = History(context: context)
        history.lastTime = lastTime
        history.typeOfCall = typeOfCall
        history.contact = contact
        _histories?.append(history)
        save()
    }
    
    func deleteHistory(index: IndexPath){
        let history = histories[index.row]
        histories.remove(at: index.row)
        context.delete(history)
        save()
    }
    
    func save(){
        Database.shared.saveContext()
    }
    
    func deleteAllRecents(){
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "History")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("error")
        }
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
        let date2 = Calendar.current.startOfDay(for: RecentsTableViewController().currentDate)
        
        let component = Calendar.current.dateComponents([.day], from: date1, to: date2)
        
        if component.day == 0 {
            return String(format: "%02d:%02d", hour, minute)
        }
        else if component.day == 1 {
            return "Yesterday"
        }
        else if component.day! > 1 && component.day! <= 7{
            return getWeekDay(timeInterval: time)
        }
        else {
            return String(format: "%02d/%02d/%04d", day, month, year)
        }
    }
    
    func getWeekDay(timeInterval: TimeInterval) -> String{
        let dateFormatter = DateFormatter()
        let thatDay = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.locale = Locale(identifier: "EN")
        let orderedDay = Calendar.current.component(.weekday, from: thatDay) - 1
        let weekDay = dateFormatter.weekdaySymbols[orderedDay]
        return weekDay
    }
}
