//
//  Checklist.swift
//  Checklist
//
//  Created by Eder  Padilla on 13/10/23.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items: [ChecklistItem] = []
    var iconName: String
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        items.filter { !$0.checked }.count
    }
}
