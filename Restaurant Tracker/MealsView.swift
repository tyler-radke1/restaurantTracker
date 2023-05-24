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
    
    //Binding var linking back to restaurant view
    @Binding var restaurantLinkActive: Bool
    
    //State bool for nav link forward to creating/viewing meal
    @State var mealViewLinkActive: Bool = false
    
    @State var linkType: LinkType = .addRestaurant
    
    var body: some View {

            VStack {
                List {
                    Group {
                        ForEach(meals) { meal in
                            Button {
                                //Change stuff and what not
                                linkType = .mealDetailView
                                mealViewLinkActive.toggle()
                            } label: {
                                Text(meal.name ?? "meal")
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
                    mealViewLinkActive.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            } .navigationDestination(isPresented: $mealViewLinkActive) {
                AddMealView(addMealLinkActive: $mealViewLinkActive)
            }
        
            .onAppear {
                if let currentRestaurant = persistence.currentRestaurant {
                    meals = currentRestaurant.meals?.allObjects as? [Meal] ?? []
                }
            }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(persistence: PersistenceController.shared, restaurantLinkActive: Binding.constant(false))
    }
}
