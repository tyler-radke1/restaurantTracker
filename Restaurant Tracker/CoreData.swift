//
//  CoreData.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/19/23.
//

import SwiftUI
import CoreData

enum ObjectModelType: String {
    case restaurant = "Restaurant"
    case meal = "Meal"
}

class PersistenceController: ObservableObject {
    
    static let shared = PersistenceController()
    
    var currentRestaurant: Restaurant? = nil

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
            print("Succesfully saved")
        } catch {
            print("Error saving context")
        }
    }
    
    func createRestaurant(with name: String) {
        let context = PersistenceController.shared.container.viewContext
        
        let restaurant = Restaurant(context: context)
        
        restaurant.id = UUID()
        restaurant.name = name
        
        context.insert(restaurant)
    }
    //May or may not consolidate this into one function.
    // Upsides and downsides to both, I'm not sure
    
    //MARK: Create current restaurant var somewhere
    func createMeal(with name: String) {
        let context = PersistenceController.shared.container.viewContext
        
        let currentRestaurant = PersistenceController.shared.currentRestaurant
        
        let currentMeals = currentRestaurant?.meals?.mutableCopy() as? NSMutableSet
        
        let meal = Meal(context: context)
        
        meal.id = UUID()
        
        meal.name = name
        
        if let currentMeals {
            currentMeals.add(meal)
        } else {
            
        }
    }
}
