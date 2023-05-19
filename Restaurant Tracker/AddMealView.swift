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
    @State private var addMealLinkActive: Bool
    
    init(addMeal: Bool) {
        self.addMealLinkActive = addMeal
    }
    
    var body: some View {
        VStack {
            TextField("Enter Meal's Name", text: $mealName)
                .frame(width: 340)
            
            Button {
                let meal = Meal(name: mealName)
                
                userData.currentRestaurant.meals.append(meal)
                
                
                addMealLinkActive.toggle()
            } label: {
                Text("Add meal")
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tanCustom)
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        AddMealView(addMeal: true).environmentObject(userData)
    }
}
