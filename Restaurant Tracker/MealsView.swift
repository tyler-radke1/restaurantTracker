//
//  MealsView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct MealsView: View {
    @State private var meals: [Meal] = []
    @State private var addMealLinkActive: Bool = false
    
    var body: some View {
       // NavigationStack {
            VStack {
                List {
                    Group {
                        ForEach(meals) { meal in
                            Text(meal.name)
                        }
                        
                        if meals.isEmpty {
                            HStack {
                                Spacer()
                                Text("Add some meals from this restaurant to see them here!")
                                Spacer()
                            }
                                
                        }
                    }
                }
            }
            .background(Color.tanCustom)
            .scrollContentBackground(.hidden)
            .navigationTitle("Meals")
            .toolbar {
                Button {
                    addMealLinkActive = true
                } label: {
                    Image(systemName: "plus")
                }

                
            } .navigationDestination(isPresented: $addMealLinkActive) {
                AddMealView(addMealLinkActive: $addMealLinkActive)
            }
      //  }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
