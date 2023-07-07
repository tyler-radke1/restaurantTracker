//
//  CreateRestaurantView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct AddRestaurantView: View {
    @StateObject var viewModel = AddRestaurantViewModel()
    
    @Binding var addRestaurantLinkActive: Bool
    
    var body: some View {
        VStack() {
            //Restaurant Name
            VStack {
                Spacer()
                Text("Restaurant Name")
                TextField("Name", text: $viewModel.restName)
                    .frame(width: 340)
            }
            
            VStack {
                Spacer()
                Button("Add Restaurant") {
                    viewModel.addButton($addRestaurantLinkActive)
                }
                Spacer()
            }
        }
        .navigationTitle("Add Restaurant")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tanCustom)
    }
}

struct AddRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
