//
//  ViewController.swift
//  Tasque
//
//  Created by Ahmad Yasser on 08/01/2022.
//

import UIKit

class HomeViewController: UITableViewController {
    var observation: NSKeyValueObservation?
    @objc var model = HomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observe()
    }
    //MARK: - Add new item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Tasque item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            self.model.addTask(text: textField.text ?? "")
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
        return model.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasqueCell", for: indexPath)
        let item = model.items[indexPath.row]
        let check = UIImageView(image: UIImage(systemName: "checkmark"))
        
        check.tintColor = UIColor.blue
        cell.backgroundColor = UIColor.cell
        cell.textLabel?.textColor = UIColor.text
        tableView.backgroundColor = UIColor.background
        cell.textLabel?.text = item.title
        cell.accessoryView = item.done ? check : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.itemPressed(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    func observe() {
        observation = model.observe(\.items, options: .new, changeHandler: { (homeModel, change) in
            print("itemArray is updated!")
            self.tableView.reloadData()
        })
    }
    func setupCell() {
        
    }
}


