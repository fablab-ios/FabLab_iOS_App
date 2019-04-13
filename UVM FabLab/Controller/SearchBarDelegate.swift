//
//  SearchBarDelegate.swift
//  UVM FabLab
//
//  Created by Sam Clark on 4/13/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import Foundation
import UIKit

extension TicketTableViewController : UISearchBarDelegate {
    @objc func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("test")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

