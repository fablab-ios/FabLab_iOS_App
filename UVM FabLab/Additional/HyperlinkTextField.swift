//
//  HyperlinkTextField.swift
//  UVM FabLab
//
//  Created by Abby Linstone on 5/3/19.
//  Copyright © 2019 UVM. All rights reserved.
//

@IBDesignable
class HyperlinkTextField: NSTextField {
    @IBInspectable var href: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let attributes: [String: AnyObject] = [
            NSForegroundColorAttributeName: NSColor.blueColor(),
            NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue
        ]
        self.attributedStringValue = NSAttributedString(string: self.stringValue, attributes: attributes)
    }
    
    override func mouseDown(theEvent: NSEvent) {
        NSWorkspace.sharedWorkspace().openURL(NSURL(string: self.href)!)
    }
}
