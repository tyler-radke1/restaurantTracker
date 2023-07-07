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
        VStack {
            Text(meal.name)
                .padding(.all)
            
            Toggle("Did you like it?", isOn: $meal.likeMeal)
                .padding(.all)
            
            TextField("Notes", text: $meal.notes, axis: .vertical)
                .padding(.all)
                .lineLimit(4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tanCustom)
        .navigationTitle(meal.name)
        
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
