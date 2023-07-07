//
//  AddMealViewModel.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 7/7/23.
//

import Foundation
import SwiftUI

extension AddMealView {
    @MainActor class AddMealViewModel: ObservableObject {
        @Published var mealName: String = ""
        
        @Published var likeMeal: Bool = false
        
        @Published var notes: String = ""
        
        @Published var isShowingCamera: Bool = false
        
        @Published var shared = DataControl.shared
        
        func addMealTo(restaurant: Restaurant, _ link: Binding<Bool>) {
            let restaurants = shared.getRestaurants()
            
            var newRestaurant = restaurant
            //Create a meal
            let newMeal = Meal(name: mealName, likeMeal: likeMeal, notes: notes)
            
            var newRestaurants = [Restaurant]()
            
            newRestaurant.meals.append(newMeal)
            
            for restaurant in restaurants {
                guard newRestaurant.id != restaurant.id else {
                    newRestaurants.append(newRestaurant)
                    continue
                }
                newRestaurants.append(restaurant)
            }

            do {
                try DataControl.shared.write(object: newRestaurants, with: "restaurants.json")
            } catch {
                print("Could not write restaurants")
            }
            link.wrappedValue.toggle()
        }
    }
}
