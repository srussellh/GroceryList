//
//  GroceriesTableViewController.swift
//  Groceries
//
//  Created by Bobba Kadush on 5/10/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit
import UserNotifications

class GroceriesTableViewController: UITableViewController {

    @IBAction func addButtonPressed(_ sender: Any) {
        print("button pressed")
       presentAlert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroceriesController.shared.groceries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroceriesCell", for: indexPath) as? GroceriesTableViewCell else {return UITableViewCell()}
        let groceries = GroceriesController.shared.groceries[indexPath.row]
        cell.update(groceries: groceries)
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let groceries = GroceriesController.shared.groceries[indexPath.row]
            GroceriesController.shared.delete(groceries: groceries)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: AlertController
    func presentAlert(){
        let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your shopping list", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "BUY BUY BUY"
            textField.keyboardType = .default
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let save = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let itemText = alertController.textFields?.first?.text else {return}
            GroceriesController.shared.create(name: itemText)
            self.tableView.reloadData()
        }
        alertController.addAction(cancel)
        alertController.addAction(save)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension GroceriesTableViewController: GroceriesTableViewCellDelegate {
    func toggleSettingsForCell(cell: GroceriesTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let groceries = GroceriesController.shared.groceries[indexPath.row]
        GroceriesController.shared.changeBool(groceries: groceries)
        cell.update(groceries: groceries)
    }
}
