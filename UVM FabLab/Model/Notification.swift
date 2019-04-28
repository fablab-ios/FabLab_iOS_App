//
//  Notification.swift
//  UVM FabLab
//
//  Created by Sam Clark on 4/27/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import Foundation

class Notification {
    let ticketNumber: Int
    let email: String
    let title: String
    let message: String
    
    init(ticketNumber: Int, email: String, title: String, message: String) {
        self.ticketNumber = ticketNumber
        self.email = email
        self.title = title
        self.message = message
    }
}
