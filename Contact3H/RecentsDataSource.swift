//
//  RecentsAll_DataSource.swift
//  Contact3H
//
//  Created by Hung Nguyen on 10/19/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class RecentsDataSource: NSObject, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecentsCell
        cell.nameLabel.text = DataService.shared.histories[indexPath.row].contact?.lastName
        cell.statusLabel.text = "không xác định"
        cell.lastTimeLabel.text = DataService.shared.setupLastTime(time: DataService.shared.histories[indexPath.row].lastTime)
        
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            DataService.shared.deleteHistory(index: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert{
            
        }
    }
}
