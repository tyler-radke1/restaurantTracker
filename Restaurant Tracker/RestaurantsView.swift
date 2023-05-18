//
//  ContentView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct RestaurantsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}


