//
//  MealDetailView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/22/23.
//

import SwiftUI

struct MealDetailView: View {
    @Binding var restaurant: Restaurant
    
    @State var meal: Meal
    
    var body: some View {
        Text(meal.name)
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView(currentRestaurant: Restaurant(name: "default", meals: []))
    }
}
