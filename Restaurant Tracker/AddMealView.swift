//
//  AddMealView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/19/23.
//

import SwiftUI

struct AddMealView: View {
    @State private var mealName: String = ""
    
    @Binding var addMealLinkActive: Bool
    
    weak var shared = DataControl.shared
    
    var body: some View {
        VStack {
            TextField("Enter Meal's Name", text: $mealName)
                .frame(width: 340)
            
            Button {
                let restaurants = shared?.restaurants
                let current = shared?.currentRestaurant
                //Create a meal
                let newMeal = Meal(name: mealName)
                
                if var current, var restaurants {
                    current.meals.append(newMeal)
                    
                    //Replace
                }
                
            
                
               
                
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
        AddMealView(addMealLinkActive: .constant(true))
    }
}
