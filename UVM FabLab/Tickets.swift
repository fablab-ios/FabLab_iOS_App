//
//  Tickets.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 3/9/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit
class Ticket: NSObject {
    var ticketNumber: Int
    var progress: String
    let dateCreated: Date
    init(name: String, progress: String, ticketNumber: Int) {
        self.ticketNumber = ticketNumber
        self.progress = progress
        self.dateCreated = Date()
        super.init()
    }
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber =
                UUID().uuidString.components(separatedBy: "-").first!
            self.init(name: randomName,
                      progress: randomSerialNumber,
                      ticketNumber: randomValue)
        } else {
            self.init(name: "", progress: "", ticketNumber: 0)
        }
    }
}

