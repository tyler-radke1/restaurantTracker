//
//  ContentView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI
import CoreData

enum LinkType {
    case viewMeals
    case addRestaurant
    case addMeal
    case mealDetailView
}

struct RestaurantsView: View {
    @State private var linkIsActive = false
    
    @State private var linkType: LinkType = .addRestaurant
        
    @State private var restaurants: [Restaurant] = []
    
    @State var currentRestaurant: Restaurant
    
    private let shared = DataControl.shared
    var body: some View {
        NavigationStack {
            List {
                    ForEach(restaurants) { restaurant in
                            Button {
                                currentRestaurant = restaurant
                                linkType = .viewMeals
                                linkIsActive.toggle()
                            } label: {
                                Text(restaurant.name)
                                    .foregroundColor(Color.black)
                            }
                    }
                    .onDelete(perform: delete)
                    
                    if restaurants.isEmpty {
                        Text("Add restaurants for them to appear here!")
                    }
            }
            .background(Color.tanCustom)
            .scrollContentBackground(.hidden)
            .navigationTitle("Restaurants")
            .toolbar {
                Button {
                    linkType = .addRestaurant
                    linkIsActive = true
                } label: {
                    Image(systemName: "plus")
                }

            } .navigationDestination(isPresented: $linkIsActive) {
                switch linkType {
                case .viewMeals:
                    MealsView(restaurantLinkActive: $linkIsActive, currentRestaurant: $currentRestaurant)
                case .addRestaurant:
                    AddRestaurantView(restaurants: $restaurants, isLinkActive: $linkIsActive)
                default:
                    //This will probably cause weird behavior, but also shouldn't ever get hit.
                    RestaurantsView(currentRestaurant: currentRestaurant)
                }
            }
            
            .onAppear {
                //Retrieve restaurants here
                restaurants = shared.getRestaurants()
                currentRestaurant = Restaurant(name: "Default", meals: [])
            }
        }
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



struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView(currentRestaurant: Restaurant(name: "Default", meals: []))
    }
}



