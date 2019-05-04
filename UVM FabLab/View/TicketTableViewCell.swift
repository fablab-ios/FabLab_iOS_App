//
//  TableCell.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 4/13/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import Foundation
import UIKit

class TicketTableViewCell: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var TicketNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
}
