//
//  TicketTableViewController.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 3/19/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit

class TicketTableViewController: UITableViewController {
    
    var email = ""
    var tickets: [Ticket] = []
    let fabWebAPI = (UIApplication.shared.delegate as! AppDelegate).fabWebAPI
    
    let notificationManager = (UIApplication.shared.delegate as! AppDelegate).notificationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notificationManager.fetchAndDisplay()
    }
    
    @IBAction func emailButtonTouch(_ sender: Any) {
        // https://stackoverflow.com/questions/26567413/get-input-value-from-textfield-in-ios-alert-in-swift
        let alert = UIAlertController(title: "FabLab Email", message: "Enter the email used to submit your FabLab tickets.", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.email = textField!.text!
            self.notificationManager.setEmail(email: self.email)
            self.refresh()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func refreshButtonTouch(_ sender: Any) {
        self.refresh()
    }
    
    func refresh() {
        fabWebAPI.getTickets(searchTerm: self.email) { (tickets) in
            self.tickets = tickets
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tickets"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! TicketTableViewCell
        
        let ticket = tickets[indexPath.row]
        cell.idLabel?.text = "#" + String(ticket.ticketNumber)
        cell.nameLabel?.text = ticket.ticketName
        cell.statusLabel?.text = ticket.status
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }

}
