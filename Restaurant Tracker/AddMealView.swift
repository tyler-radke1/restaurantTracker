//
//  AddMealView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/19/23.
//

import SwiftUI

struct AddMealView: View {
    @State private var mealName: String = ""
    
    @State private var likeMeal: Bool = false
    
    @State private var notes: String = ""
    
    @Binding var currentRestaurant: Restaurant
    
    @Binding var addMealLinkActive: Bool
    
    weak var shared = DataControl.shared
    
    var body: some View {
            VStack {
                TextField("Enter Meal's Name", text: $mealName)
                    .frame(width: 340)
                    .padding(.all)
                
                Toggle("Did you like it?", isOn: $likeMeal)
                    .padding(.all)
                
                TextField("Notes", text: $notes, axis: .vertical)
                    .padding(.all)
                    .lineLimit(1...4)
                
                Button("Add Meal", action: addMealButton)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.tanCustom)
            .navigationTitle("Add Meal")
    }
    
    func addMealButton() {
        guard let restaurants = shared?.getRestaurants() else { return }
        //Create a meal
        let newMeal = Meal(name: mealName, likeMeal: likeMeal, notes: notes)
        
        var newRestaurants = [Restaurant]()
        
        currentRestaurant.meals.append(newMeal)
        
        for restaurant in restaurants {
            guard currentRestaurant.id != restaurant.id else {
                newRestaurants.append(currentRestaurant)
                continue
            }
            newRestaurants.append(restaurant)
        }

        do {
            try DataControl.shared.write(object: newRestaurants, with: "restaurants.json")
        } catch {
            print("Could not write restaurants")
        }
//
        addMealLinkActive.toggle()
    }
}

//struct AddMealView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMealView(meals:Binding([Meal]()), addMealLinkActive: .constant(true))
//    }
//}
