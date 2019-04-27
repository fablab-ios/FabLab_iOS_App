//
//  TicketTableViewController.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 3/19/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit

class TicketTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tickets: [Ticket] = []
    
    let fabWebAPI = FabWebAPI()
    
    let notificationManager = (UIApplication.shared.delegate as! AppDelegate).notificationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        notificationManager.requestAuthorization()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // number of tickets
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tickets"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let intArray = [3, 4, 5, 0]
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = "\(tickets[indexPath.row].studentName)"
        let progressView = UIProgressView(progressViewStyle: .default)
        //setting height of progressView
        progressView.frame = CGRect(x: 230, y: 20, width: 130, height: 130)
        //progressView.progress += 2
        progressView.rightAnchor.accessibilityActivate()
        progressView.setProgress(Float(intArray.randomElement()!), animated: false)
        progressView.progressTintColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.3333333333, alpha: 1)
        cell.contentView.addSubview(progressView)
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
