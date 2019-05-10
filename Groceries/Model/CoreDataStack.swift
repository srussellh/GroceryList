//
//  CoreDataStack.swift
//  Groceries
//
//  Created by Bobba Kadush on 5/10/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "Groceries")
        persistentContainer.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Unresolved Error: \(error)")
            }
        })
        return persistentContainer
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
