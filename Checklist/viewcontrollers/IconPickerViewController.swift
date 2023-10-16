//
//  IconPickerViewController.swift
//  Checklist
//
//  Created by Eder  Padilla on 15/10/23.
//

import UIKit

class IconPickerViewController: UITableViewController {
    
    weak var delegate: IconPickerViewControllerDelegate?
    let icons = ["No Icon", "Appointments", "Birthdays", "Chores",
                 "Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        icons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "IconCell",
            for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        return cell
    }
    
}

protocol IconPickerViewControllerDelegate: AnyObject {
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}
