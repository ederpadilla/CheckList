//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Eder  Padilla on 09/10/23.
//

import Foundation
import UserNotifications

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
    
    func scheduleNotification() {
        func scheduleNotification() {
            if shouldRemind && dueDate > Date() {
                
                let content = UNMutableNotificationContent()
                content.title = "Reminder:"
                content.body = text
                content.sound = UNNotificationSound.default
                
                
                let calendar = Calendar(identifier: .gregorian)
                let components = calendar.dateComponents(
                    [.year, .month, .day, .hour, .minute],
                    from: dueDate)
                
                let trigger = UNCalendarNotificationTrigger(
                    dateMatching: components,
                    repeats: false)
                
                let request = UNNotificationRequest(
                    identifier: "\(itemID)",
                    content: content,
                    trigger: trigger)
                
                let center = UNUserNotificationCenter.current()
                center.add(request)
                
                print("Scheduled: \(request) for itemID: \(itemID)")
            }
        }
        
    }
}
