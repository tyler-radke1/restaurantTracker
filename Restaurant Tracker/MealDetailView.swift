//
//  MealDetailView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/22/23.
//

import SwiftUI

struct MealDetailView: View {
    @State var meal: Meal?
    
    var body: some View {
        if let name = meal?.name {
            Text(name)
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
