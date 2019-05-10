//
//  GroceriesController.swift
//  Groceries
//
//  Created by Bobba Kadush on 5/10/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import Foundation
import CoreData

class GroceriesController {
    //MARK: Properties
    static let shared = GroceriesController()
    
    var groceries: [Groceries] {
        let request: NSFetchRequestResult<Groceries> = Groceries.fetchRequest()
        return try! CoreDataStack.context.fetch(request)
    }
    
    //CRUD
    func create(name: String){
        Groceries(name: name)
        saveToPersistence()
    }
    
    func delete(groceries: Groceries){
        if let moc = groceries.managedObjectContext{
            moc.delete(groceries)
            saveToPersistence()
        }
    }
    
    func saveToPersistence(){
        let moc = CoreDataStack.context
        do {
            try moc.save()
        }catch{
            print("There was an error saving: \(error.localizedDescription)")
        }
    }
    
}

