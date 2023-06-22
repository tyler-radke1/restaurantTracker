//
//  AddMealView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/19/23.
//

import SwiftUI

struct AddMealView: View {
    @State private var mealName: String = ""
    
    @Binding var meals: [Meal]
    
    @Binding var addMealLinkActive: Bool
    
    weak var shared = DataControl.shared
    
    var body: some View {
        VStack {
            TextField("Enter Meal's Name", text: $mealName)
                .frame(width: 340)
            
            Button("Add Meal", action: addMealButton)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tanCustom)
        .navigationTitle("Add Meal")
        
    }
    
    func addMealButton() {
        guard let restaurants = shared?.restaurants, var current = shared?.currentRestaurant else { return }
        //Create a meal
        let newMeal = Meal(name: mealName)
        
        var newRestaurants = [Restaurant]()
        
        meals.append(newMeal)
        
//        current.meals.append(newMeal)
//
//        for restaurant in restaurants {
//            newRestaurants.append( restaurant.id == current.id ? current : restaurant)
//        }
//
//        do {
//            try DataControl.shared.write(object: newRestaurants, with: "restaurants.json")
//        } catch {
//            print("Could not write restaurants")
//        }
//
        addMealLinkActive.toggle()
    }
}

//struct AddMealView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMealView(meals:Binding([Meal]()), addMealLinkActive: .constant(true))
//    }
//}
