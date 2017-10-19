//
//  RecentsMissedCall_DataSource.swift
//  Contact3H
//
//  Created by Hung Nguyen on 10/19/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import UIKit

class RecentsMissedCall_DataSource: NSObject, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.historiesForMissedCall.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! RecentsCell
        cell.nameLabel.text = DataService.shared.historiesForMissedCall[indexPath.row].contact?.lastName
        cell.statusLabel.text = "không xác định"
        cell.lastTimeLabel.text = DataService.shared.setupLastTime(time: DataService.shared.historiesForMissedCall[indexPath.row].lastTime)
        cell.typeOfCallimage.image = #imageLiteral(resourceName: "MissedCall")
        cell.nameLabel.textColor = .red
        cell.statusLabel.textColor = .red
        return cell
    }

}
