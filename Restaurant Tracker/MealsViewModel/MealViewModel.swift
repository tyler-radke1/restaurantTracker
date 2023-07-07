//
//  MealViewModel.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 7/6/23.
//

import Foundation
import SwiftUI

extension MealsView {
    @MainActor class MealsViewModel: ObservableObject {
        @Published var meals: [Meal] = []
        
        //Binding var linking back to restaurant view
        @Published var restaurantLinkActive: Bool = false
        
        @Published var currentRestaurant: Restaurant = Restaurant(name: "Default", meals: [])
        
        @Published var restaurants: [Restaurant] = []

        @Published var mealViewLinkActive: Bool = false
        
        @Published var addMealLinkActive = false
        
        @Published var mealDetailViewLinkActive = false
        
        @Published var mealToShow: Meal?
        
        func delete(at indexSet: IndexSet) {
            meals.remove(atOffsets: indexSet)
            
            currentRestaurant.meals = meals
            
            var newRestaurants = [Restaurant]()
            
            for restaurant in restaurants {
                let idCheck = restaurant.id == currentRestaurant.id
                
                newRestaurants.append(idCheck ? currentRestaurant : restaurant)
            }
            
            do {
                try DataControl.shared.write(object: newRestaurants, with: "restaurants.json")
                restaurants = DataControl.shared.getRestaurants()
            } catch {
                print("Failed to write restaurants")
            }
        }
        
        func mealTapped(meal: Meal) {
            self.mealToShow = meal
            mealDetailViewLinkActive.toggle()
        }
        
        func addMealTapped() {
            addMealLinkActive.toggle()
        }
        
        func setRestaurantVars(restaurant: Restaurant) {
            if let current = updateCurrentRestaurant(restaurant) {
                currentRestaurant = current
            }
            meals = currentRestaurant.meals
        }
        private func updateCurrentRestaurant(_ restaurantToUpdate: Restaurant) -> Restaurant? {
            
            let restaurants = DataControl.shared.getRestaurants()
            
            let newCurrent = restaurants.first { rest in
                rest.id == restaurantToUpdate.id
            }
            
            return newCurrent
        }
    }
}
