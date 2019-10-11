//
//  ViewController.swift
//  Todoey
//
//  Created by MASMAS on 2019/10/10.
//  Copyright © 2019 MASMAS. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    
    var itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    
    
    //IBOutlets
    @IBOutlet var todoListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
        
    }

    //MARK - Tableview Datasource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        
        return cell
    }
    
    //MARK - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
   
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        }
    
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
    
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) {(action) in
            
            self.itemArray.append(textField.text!)
            print(self.itemArray)
   
            self.tableView.reloadData()
        
        }
    
        alert.addTextField { (alertTextField) in
                   
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
                
        }
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
