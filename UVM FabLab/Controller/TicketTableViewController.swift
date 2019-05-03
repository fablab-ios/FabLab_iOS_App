//
//  TicketTableViewController.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 3/19/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit

class TicketTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var header: UITextField!
    var refreshControl = UIRefreshControl()
    let cellReuseIdentifier = "cell"
    var email = ""
    var tickets: [Ticket] = []
    let fabWebAPI = (UIApplication.shared.delegate as! AppDelegate).fabWebAPI
    
    let notificationManager = (UIApplication.shared.delegate as! AppDelegate).notificationManager
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notificationManager.fetchAndDisplay()
                
        tableView.delegate = self
        tableView.dataSource = self
        
        // set up the refresh control
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.tableView.addSubview(self.refreshControl)
    }
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        self.refresh()
        self.refreshControl.endRefreshing()
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
    

    
    func refresh() {
        fabWebAPI.getTickets(searchTerm: self.email) { (tickets) in
            self.tickets = tickets
            self.tableView.reloadData()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Tickets"
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TicketTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TicketTableViewCell
        
        let created =  UIImage(named: "created")
        let waiting =  UIImage(named: "waiting_on_input")
        let ready =  UIImage(named: "ready_for_pickup")
        let closed =  UIImage(named: "closed")
        
        let ticket = tickets[indexPath.row]
//        cell.numberLabel?.text = "#" + String(ticket.ticketNumber)
//        cell.nameLabel?.text = ticket.ticketName
        cell.numberLabel.text = "Ticket: " + "\(ticket.ticketNumber)"
        cell.nameLabel.text = "Client Name: " + "\(ticket.status)"
        cell.TicketNameLabel.text = "Ticket Name: " + "\(ticket.ticketName)"
        cell.dateLabel.text = "Date Submitted: " + "\(ticket.date)"
        //cell.status?.text = ticket.status

        if("\(ticket.status)" == "Waiting on client input"){
            cell.myImageView.image =  ready
        }else if("\(ticket.status)" == "Ready for pickup"){
            cell.myImageView.image =  ready
        }else if("\(ticket.status)" == "Closed"){
            cell.myImageView.image =  closed
        }else{
            cell.myImageView.image = created
        }

        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 84
//    }

}
