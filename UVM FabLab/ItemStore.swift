//
//  ItemStore.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 3/19/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Ticket]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Ticket {
        let newItem = Ticket(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(_ Ticket: Ticket) {
        if let index = allItems.index(of: Ticket) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        else {
            // Get reference to obejct being moved so you can reinsert it
            let movedItem = allItems[fromIndex]
            
            // Remove Ticket from array
            allItems.remove(at: fromIndex)
            
            // Insert Ticket in array at new location
            allItems.insert(movedItem, at: toIndex)
        }
    }
    
    // MARK: - Archiver
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
}

