//
//  CreateRestaurantView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct AddRestaurantView: View {
    
    @State var restName: String = ""
    
    @Binding var restaurants: [Restaurant]
    
    @Binding var isLinkActive: Bool

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
                Button("Add Restaurant", action: addButton)
                Spacer()
            }
        }
        .navigationTitle("Add Restaurant")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tanCustom)
    }
    
    func addButton() {
            guard restName != "" else { return }
            //Create Restaurant
            let restaurant = Restaurant(name: restName, meals: [])
            
            //Save somehow
            restaurants.append(restaurant)
            
            do {
                try DataControl.shared.write(object: restaurants, with: "restaurants.json")
            } catch {
                print("Failure saving restaurant")
            }
            
            isLinkActive.toggle()
    }
}

struct AddRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView(currentRestaurant: Restaurant(name: "default", meals: []))
    }
}
