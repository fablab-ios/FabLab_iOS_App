//
//  SecondViewController.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 3/3/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit


class SecondViewController: UITableViewController {
    var itemStore: ItemStore!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView,
                                                     numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        cell.textLabel?.text = "\(item.ticketNumber)"
        cell.detailTextLabel?.text = "$\(item.progress)"
        return cell }
}
