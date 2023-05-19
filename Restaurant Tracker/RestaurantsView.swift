//
//  ContentView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    //Has default value to avoid having nil/coalescing later on, but this value shouldn't ever actually get read.
    @Published var currentRestaurant: Restaurant = Restaurant(name: "This shouldn't ever show", meals: [])
}
struct RestaurantsView: View {
    @EnvironmentObject var userData : UserData
    @State private var addMealLinkActive = false 
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    ForEach(userData.restaurants) { restaurant in
                        NavigationLink(destination: MealsView()) {
                            Button {
                                userData.currentRestaurant = restaurant
                            } label: {
                                Text(restaurant.name)
                                    .foregroundColor(Color.black)
                            }

                        }
                    }
                    
                    if userData.restaurants.isEmpty {
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
        let data = UserData()
        RestaurantsView().environmentObject(data)
    }
}

