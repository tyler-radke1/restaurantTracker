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
    
    @StateObject var persistence: PersistenceController
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var restaurants: [Restaurant] = []
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    ForEach(restaurants) { restaurant in
                            Button {
                                persistence.currentRestaurant = restaurant
                                linkType = .viewMeals
                                linkIsActive.toggle()
                            } label: {
                                Text(restaurant.name ?? "Hello")
                                    .foregroundColor(Color.black)
                            }
                    }
                    .onDelete { indexSet in
                        deleteRest(at: indexSet)
                    }
                    
                    if restaurants.isEmpty {
                        Text("Add restaurants for them to appear here!")
                    }
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
                    MealsView(persistence: persistence, restaurantLinkActive: $linkIsActive)
                case .addRestaurant:
                    AddRestaurantView(isLinkActive: $linkIsActive)
                default:
                    //This will probably cause weird behavior, but also shouldn't ever get hit.
                   RestaurantsView(persistence: persistence)
                }
            }
            
            .onAppear {
                restaurants = persistence.fetchValues(for: .restaurant)
            }
        }
    }
    
    /// Delete Restaurant
    /// Deletes a given restaurant from coreData
    /// - Parameter offsets: Index set for list item to be deleted
    func deleteRest(at offsets: IndexSet) {
        for index in offsets {
            let rest = restaurants[index]
            
            persistence.container.viewContext.delete(rest)
            
            persistence.save()
        }
    }
}



struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView(persistence: PersistenceController.shared)
    }
}



