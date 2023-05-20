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
    
    @State private var restaurants: [RestaurantCD] = []
    
    @Environment(\.managedObjectContext) private var viewContext

    private let persistence = PersistenceController.shared
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    ForEach(restaurants) { restaurant in
                        NavigationLink(destination: MealsView()) {
                            Button {
                                
                            } label: {
                                Text(restaurant.name ?? "Hello")
                                    .foregroundColor(Color.black)
                            }

                        }
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
        }
    }
}



struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}

