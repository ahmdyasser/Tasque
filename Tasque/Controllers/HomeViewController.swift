//
//  ViewController.swift
//  Tasque
//
//  Created by Ahmad Yasser on 08/01/2022.
//

import UIKit

class HomeViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    var itemArray = [Item]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item(title: "buy the milk", done: false)
        itemArray.append(newItem)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    //MARK: - Add new item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Tasque item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            //things that will happen when we click add item button
            let newItem = Item(title: textField.text!, done: false)
            
            self.itemArray.insert(newItem, at: 0)
            
            self.tableView.reloadData()
            
            
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "enter new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasqueCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        let check = UIImageView(image: UIImage(systemName: "checkmark"))
        check.tintColor = UIColor(named: K.Colors.blue)
        cell.backgroundColor = UIColor(named: K.Colors.cell)
        cell.textLabel?.textColor = UIColor(named: K.Colors.text)
        tableView.backgroundColor = UIColor(named: K.Colors.background)
        cell.textLabel?.text = item.title
        
        cell.accessoryView = item.done ? check : .none
        return cell
    }
    
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done.toggle()
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
}

