//
//  Contact.swift
//  Contact3H
//
//  Created by MTQ on 9/12/17.
//  Copyright © 2017 MTQ. All rights reserved.
//

import Foundation
import RealmSwift

final class Contact: Object {
    dynamic var firstName: String = ""
    dynamic var lastName: String = ""
    dynamic var company: String = ""
    dynamic var phoneNumber: String = ""
    dynamic var typeDevice: Int = 0 // 1: iPhone, 0: Other
    dynamic var sectionName: String = ""
}

final class History: Object {
    dynamic var lastTime: String = ""
    dynamic var typeCall: Int = 0 // 1: ca
    dynamic var contact: Contact?
}
