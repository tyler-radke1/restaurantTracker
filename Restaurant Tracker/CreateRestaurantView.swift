//
//  CreateRestaurantView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct CreateRestaurantView: View {
    @EnvironmentObject var restaurantsData : RestaurantsData
    @State var restName: String = ""
    var body: some View {
        VStack {
            //Restaurant Name
            VStack {
                Spacer()
                Text("Restaurant Name")
                TextField("Name", text: $restName)
                    .frame(width: 340)
                Spacer()
                Divider()
            }
            
            VStack {
                Button("Add Restaurant") {
                    restaurantsData.restaurants.append(Restaurant(name: restName, meals: []))
                }
            }
        }
        .navigationTitle("Add Restaurant")
        .background(Color.tanCustom)
        .environmentObject(restaurantsData)
    }
}

struct CreateRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRestaurantView()
    }
}
