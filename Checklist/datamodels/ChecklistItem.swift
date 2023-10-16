//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Eder  Padilla on 09/10/23.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    init(text: String = "", checked: Bool = false) {
        self.text = text
        self.checked = checked
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
