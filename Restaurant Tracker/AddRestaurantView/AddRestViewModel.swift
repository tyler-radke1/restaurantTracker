//
//  AddMealViewModel.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 7/7/23.
//

import Foundation
import SwiftUI

extension AddRestaurantView {
    @MainActor class AddRestaurantViewModel: ObservableObject {
        @Published var restName: String = ""
        
        private var shared = DataControl.shared
    
        func addButton(_ linkActive: Binding<Bool>) {
                guard restName != "" else { return }
                //Create Restaurant
                let restaurant = Restaurant(name: restName, meals: [])
            
                var restaurants = shared.restaurants
                
                //Save
                restaurants.append(restaurant)
                
                do {
                    try DataControl.shared.write(object: restaurants, with: "restaurants.json")
                } catch {
                    print("Failure saving restaurant")
                }
                
            linkActive.wrappedValue.toggle()
        }
    }
}
