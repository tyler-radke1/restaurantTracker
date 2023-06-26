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
    
    @EnvironmentObject var dataControl: DataControl
    
    private let shared = DataControl.shared
    
    @State private var restaurants: [Restaurant] = []
    
    @State private var currentRestaurant: Restaurant?
    
    var body: some View {
        NavigationStack {
            List {
                Group {
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
                    .onDelete { indexSet in
                        //Delete restaurant here
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
                let instance = DataControl()
                switch linkType {
                case .viewMeals:
                    MealsView(restaurantLinkActive: $linkIsActive, currentRestaurant: currentRestaurant).environmentObject(instance)
                case .addRestaurant:
                    AddRestaurantView(isLinkActive: $linkIsActive)
                default:
                    //This will probably cause weird behavior, but also shouldn't ever get hit.
                    RestaurantsView()
                }
            }
            
            .onAppear {
                //Retrieve restaurants here
                restaurants = dataControl.restaurants
            }
        }
    }
}



struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}



