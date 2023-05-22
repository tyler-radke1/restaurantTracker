//
//  ContentView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI
import CoreData


struct RestaurantsView: View {
    @State private var addMealLinkActive = false
    
    @StateObject var persistence: PersistenceController
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var restaurants: [Restaurant] = []
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    ForEach(restaurants) { restaurant in
                        NavigationLink(destination: MealsView(persistence: persistence)) {
                            Button {
                                
                            } label: {
                                Text(restaurant.name ?? "Hello")
                                    .foregroundColor(Color.black)
                            }

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
                    addMealLinkActive = true
                } label: {
                    Image(systemName: "plus")
                }

            } .navigationDestination(isPresented: $addMealLinkActive) {
                AddRestaurantView(isLinkActive: $addMealLinkActive)
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



