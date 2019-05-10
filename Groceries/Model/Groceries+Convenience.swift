//
//  Groceries+Convenience.swift
//  Groceries
//
//  Created by Bobba Kadush on 5/10/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import Foundation
import CoreData

extension Groceries {
    convenience init(name: String, purchased: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.purchased = purchased
    }
}
