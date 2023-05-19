//
//  AddMealView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/19/23.
//

import SwiftUI

struct AddMealView: View {
    @EnvironmentObject var userData: UserData
    @State private var mealName: String = ""
    @Binding var addMealLinkActive: Bool
    
    var body: some View {
        VStack {
            TextField("Enter Meal's Name", text: $mealName)
                .frame(width: 340)
            
            Button {
                let meal = Meal(name: mealName)
                
                //MARK: Add meal to userData somewhere
                userData.currentRestaurant.meals.append(meal)
                
                addMealLinkActive.toggle()
            } label: {
                Text("Add meal")
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tanCustom)
        .navigationTitle("Add Meal")
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        AddMealView(addMealLinkActive: .constant(true)).environmentObject(userData)
    }
}