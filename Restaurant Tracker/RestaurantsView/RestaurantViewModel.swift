//
//  RestaurantViewModel.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 7/6/23.
//

import Foundation
import SwiftUI

extension RestaurantsView {
    @MainActor class RestaurantsViewModel: ObservableObject {
        
        @Published var restaurantLinkActive = false
        
        @Published var addRestaurantLinkActive = false
        
        @Published var restaurants: [Restaurant] = []
        
        @Published var currentRestaurant: Restaurant = Restaurant(name: "default", meals: [])
        
        @Published var shared = DataControl.shared
        
        func getRestaurants() {
            restaurants = shared.getRestaurants()
            currentRestaurant = Restaurant(name: "Default", meals: [])
        }
        
        func restaurantTapped(restaurant: Restaurant) {
            currentRestaurant = restaurant
            restaurantLinkActive.toggle()
        }
        
        func addRestaurantTapped() {
            addRestaurantLinkActive.toggle()
        }
        
        func delete(at indexSet: IndexSet) {
            restaurants.remove(atOffsets: indexSet)
            do {
                try shared.write(object: restaurants, with: "restaurants.json")
                restaurants = shared.getRestaurants()
            } catch {
                print("Failed to write restaurants")
            }
        }
    }
    struct RestaurantsViewModifer: ViewModifier {
        func body(content: Content) -> some View {
            content
                .background(Color.tanCustom)
                .scrollContentBackground(.hidden)
                .navigationTitle("Restaurants")
        }
    }
}
