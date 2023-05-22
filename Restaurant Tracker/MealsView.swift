//
//  MealsView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct MealsView: View {
    @State private var meals: [Meal] = []
    
    @StateObject var persistence: PersistenceController
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var addMealLinkActive: Bool = false
    
    var body: some View {

            VStack {
                List {
                    Group {
                        ForEach(meals) { meal in
                            if let name = meal.name {
                                NavigationLink(name) {
                                    MealDetailView(meal: meal)
                                }
                            }
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
        
            .onAppear {
                meals = persistence.fetchValues(for: .meal)
            }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(persistence: PersistenceController.shared)
    }
}
