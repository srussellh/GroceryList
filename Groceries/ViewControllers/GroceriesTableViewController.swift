//
//  GroceriesTableViewController.swift
//  Groceries
//
//  Created by Bobba Kadush on 5/10/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class GroceriesTableViewController: UITableViewController {

    
    
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
        
        // Configure the cell...

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let groceries = GroceriesController.shared.groceries[indexPath.row]
            GroceriesController.shared.delete(groceries: groceries)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
