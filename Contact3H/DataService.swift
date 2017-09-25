//
//  DataService.swift
//  Contact3H
//
//  Created by Hung Nguyen on 9/24/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import Foundation

class DataService {
    static let shared: DataService = DataService()
    private init() {}
    private let context = Database.shared.getContext()
    private var _histories : [History]?
    
    var histories : [History]!
    func updateHistory() {
        _histories = try! context.fetch(History.fetchRequest())
        histories = _histories
    }
    
    func addHistory(lastTime: String, typeOfCall: Int16, contact: Contact){
        let history = History(context: context)
        history.lastTime = lastTime
        history.typeOfCall = typeOfCall
        history.contact = contact
        _histories?.append(history)
        save()
    }
    
    func save(){
        Database.shared.saveContext()
    }
}
