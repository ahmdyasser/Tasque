//
//  ViewController.swift
//  Tasque
//
//  Created by Ahmad Yasser on 08/01/2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var list = ["a", "b", "c", "d", "a", "b", "c", "d", "a", "b", "c", "d"]
    let defaults = UserDefaults.standard
    
    //MARK: - Add new item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Tasque item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            //things that will happen when we click add item button
            if let text = textField.text {
                self.list.insert(text, at: 0)
                self.defaults.set(self.list, forKey: "TodoListArray")
                self.tableView.reloadData()
            }
            
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "enter new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "TodoListArray") as? Array<String> {
            list = items
        }
    
    }
    
    
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasqueCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }
}

