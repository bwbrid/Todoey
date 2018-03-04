//
//  ViewController.swift
//  Todoey
//
//  Created by 陳剣輝 on 2018/03/03.
//  Copyright © 2018年 陳剣輝. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(dataFilePath!)
        
        loadData()
    }

    
    // MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    // MARK: - Table Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // テーブル内容をクリックした時にチェック内容を設定
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: true)
        saveData()
    }
    
    @IBAction func addButtonPress(_ sender: UIBarButtonItem) {
        
        // テキストボックスを初期化
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        // 入力テキストボックスを追加
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        // [Add item] button pressed
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let item = Item()
            item.title = textField.text!
            self.itemArray.append(item)
            // save the data
            self.saveData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveData() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadData() {
        
        do {
        
            if let data = try? Data(contentsOf: dataFilePath!) {
                let decoder = PropertyListDecoder()
                itemArray = try decoder.decode([Item].self, from: data)
            }
            
        } catch {
            print("Error deconding item array, \(error)")
        }
        
    }
}

