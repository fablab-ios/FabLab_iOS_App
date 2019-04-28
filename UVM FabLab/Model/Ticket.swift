//
//  Ticket.swift
//  UVM FabLab
//
//  Created by Sam Clark on 4/13/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import Foundation

class Ticket {
    let ticketNumber: Int
    let date: String
    let time: String
    let ticketName: String
    let email: String
    let status: String
    
    init(ticketNumber: Int, date: String, time: String, ticketName: String, email: String, status: String) {
        self.ticketNumber = ticketNumber
        self.date = date
        self.time = time
        self.ticketName = ticketName
        self.email = email
        self.status = status
    }
    
    public var description: String {
        return String(ticketNumber)
    }
}
