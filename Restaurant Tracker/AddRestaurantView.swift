//
//  CreateRestaurantView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct AddRestaurantView: View {
    @EnvironmentObject var restaurantsData : UserData
    @State var restName: String = ""
    @Binding var isLinkActive: Bool
   // @Environment(\.isPresented) private var isPresented
    var body: some View {
        VStack() {
            //Restaurant Name
            VStack {
                Spacer()
                Text("Restaurant Name")
                TextField("Name", text: $restName)
                    .frame(width: 340)
            }
            
            VStack {
                Spacer()
                Button("Add Restaurant") {
                    guard restName != "" else { return }
                    restaurantsData.restaurants.append(Restaurant(name: restName, meals: []))
                    isLinkActive.toggle()
                }
                Spacer()
            }
        }
        .navigationTitle("Add Restaurant")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tanCustom)
        .environmentObject(restaurantsData)
    }
}

struct AddRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView().environmentObject(UserData())
    }
}
