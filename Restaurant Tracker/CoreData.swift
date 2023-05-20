//
//  CoreData.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/19/23.
//

import SwiftUI
import CoreData

enum ObjectModelType: String {
    case restaurant = "RestaurantCD"
    case meal = "MealCD"
}

struct PersistenceController {
    
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "RestaurantModels")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchValues<T: NSManagedObject>(for type: ObjectModelType) -> [T] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: type.rawValue)
          
          do {
              let result = try container.viewContext.fetch(fetchRequest)
              return result as! [T]
          } catch {
              print("Error fetching values: \(error)")
              return []
          }
      }
    
    func save(with object: Any? = nil) {
        let context = PersistenceController.shared.container.viewContext
        
        if let object {
            context.insert(object as! NSManagedObject)
        }
        do {
            try context.save()
        } catch {
            print("Error saving context")
        }
    }
    
    func createRestaurant(with name: String) {
        let context = PersistenceController.shared.container.viewContext
        
        let restaurant = RestaurantCD(context: context)
        
        restaurant.id = UUID()
        restaurant.name = name
        
        context.insert(restaurant)
    }
}
