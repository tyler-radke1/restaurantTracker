//
//  ContentView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct RestaurantsView: View {
    @StateObject var viewModel = RestaurantsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.restaurants) { restaurant in
                    Button {
                        viewModel.restaurantTapped(restaurant: restaurant)
                    } label: {
                        Text(restaurant.name)
                            .foregroundColor(Color.black)
                    }
                }
                .onDelete { indexSet in
                    viewModel.delete(at: indexSet)
                }
                
                if viewModel.restaurants.isEmpty {
                    Text("Add restaurants for them to appear here!")
                }
            }
            .modifier(RestaurantsViewModifer())
            
            .toolbar {
                Button {
                    viewModel.addRestaurantTapped()
                } label: {
                    Image(systemName: "plus")
                }

            }
            .navigationDestination(isPresented: $viewModel.mealsViewLinkActive, destination: {
                LazyContentView {
                    MealsView(restaurant: viewModel.currentRestaurant)
                }
            })
            
            .navigationDestination(isPresented: $viewModel.addRestaurantLinkActive, destination: {
                AddRestaurantView(addRestaurantLinkActive: $viewModel.addRestaurantLinkActive)
            })
            
            .onAppear {
                viewModel.getRestaurants()
            }
        }
    }
}



struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}



