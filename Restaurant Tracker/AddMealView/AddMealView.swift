//
//  AddMealView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/19/23.
//

import SwiftUI

struct AddMealView: View {
    
    @StateObject var viewModel = AddMealViewModel()
    
    @Binding var addMealLinkActive: Bool
    
    private var currentRestaurant: Restaurant
    
    init(linkActive: Binding<Bool>, restaurant: Restaurant) {
        _addMealLinkActive = linkActive
        currentRestaurant = restaurant
    }

    var body: some View {
            VStack {
                TextField("Enter Meal's Name", text: $viewModel.mealName)
                    .frame(width: 340)
                    .padding(.all)
                
                Toggle("Did you like it?", isOn: $viewModel.likeMeal)
                    .padding(.all)
                
                TextField("Notes", text: $viewModel.notes, axis: .vertical)
                    .padding(.all)
                    .lineLimit(1...4)
                
                Button("Select Image") {
                    viewModel.isShowingCamera.toggle()
                }
                
                Button("Add Meal") {
                    viewModel.addMealTo(restaurant: currentRestaurant, $addMealLinkActive)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.tanCustom)
            .navigationTitle("Add Meal")

    }
}

//struct AddMealView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMealView(meals:Binding([Meal]()), addMealLinkActive: .constant(true))
//    }
//}
