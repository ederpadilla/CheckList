//
//  ViewController.swift
//  Checklist
//
//  Created by Eder  Padilla on 02/10/23.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var item1 = ChecklistItem(text: "Walk the dog")
        items.append(item1)
        
        let item2 = ChecklistItem(text: "Brush my teeth", checked: true)
        items.append(item2)
        
        let item3 = ChecklistItem(text: "Learn iOS development", checked: true)
        items.append(item3)
        
        let item4 = ChecklistItem(text: "Soccer practice")
        items.append(item4)
        
        let item5 = ChecklistItem(text: "Eat ice cream")
        items.append(item5)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func addItem() {
        let newRowIndex = 0 // Agregar al inicio
        
        var item = ChecklistItem()
        item.text = "I am a new row"
        items.insert(item, at: newRowIndex) // Usar insert en lugar de append
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        
        let item = items[indexPath.row]
        configureCheckmark(for: cell, with: item)
        configureText(for: cell, with: item)
        return cell
    }
    
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
    // MARK: - Table View Delegate
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            var item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}


extension ChecklistViewController: AddItemViewControllerDelegate{
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController,
                               didFinishAdding item: ChecklistItem) {
        navigationController?.popViewController(animated: true)
    }
}
