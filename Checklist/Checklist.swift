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
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
