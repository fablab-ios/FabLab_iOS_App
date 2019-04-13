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
    let studentName: String
    let email: String
    let status: String
    let notes: String
    
    init(ticketNumber: Int, date: String, time: String, ticketName: String, studentName: String, email: String, status: String, notes: String) {
        self.ticketNumber = ticketNumber
        self.date = date
        self.time = time
        self.ticketName = ticketName
        self.studentName = studentName
        self.email = email
        self.status = status
        self.notes = notes
    }
    
    public var description: String {
        return String(ticketNumber)
    }
}
