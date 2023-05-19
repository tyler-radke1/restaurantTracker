//
//  ContentView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

class RestaurantsData: ObservableObject {
    @Published var restaurants: [Restaurant] = []
}
struct RestaurantsView: View {
    @EnvironmentObject var restaurantsData : RestaurantsData
    @ObservedObject var restaurants = RestaurantsData()
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    ForEach(restaurantsData.restaurants) { restaurant in
                        NavigationLink(destination: MealsView()) {
                            Text(restaurant.name)
                        }
                    }
                    
                    if restaurantsData.restaurants.isEmpty {
                        Text("Add restaurants for them to appear here!")
                    }
                }
            }
            .background(Color.tanCustom)
            .scrollContentBackground(.hidden)
            .navigationTitle("Restaurants")
            .toolbar {
                NavigationLink {
                    CreateRestaurantView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}



struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView().environmentObject(RestaurantsData())
    }
}

