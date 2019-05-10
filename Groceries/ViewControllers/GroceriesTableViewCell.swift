//
//  GroceriesTableViewCell.swift
//  Groceries
//
//  Created by Bobba Kadush on 5/10/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

protocol GroceriesTableViewCellDelegate: class {
    func toggleSettingsForCell(cell: GroceriesTableViewCell)
}

class GroceriesTableViewCell: UITableViewCell {

    @IBOutlet weak var groceriesLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    weak var delegate: GroceriesTableViewCellDelegate?
    
    @IBAction func buttonLabelTapped(_ sender: Any) {
        delegate?.toggleSettingsForCell(cell: self)
    }
    
    func updateButton(_ isComplete: Bool) {
        let imageName = isComplete ? "checked" : "unchecked"
       
    }
    
}
