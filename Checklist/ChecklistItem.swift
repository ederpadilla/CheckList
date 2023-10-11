//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Eder  Padilla on 09/10/23.
//

import Foundation

class ChecklistItem: Equatable {
    static func == (lhs: ChecklistItem, rhs: ChecklistItem) -> Bool {
        true
    }
    
    var text = ""
    var checked = false
    
    init(text: String = "", checked: Bool = false) {
        self.text = text
        self.checked = checked
    }
}
