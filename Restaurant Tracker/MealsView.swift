//
//  MealsView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct MealsView: View {
    @State private var meals: [Meal] = []
    
    //Binding var linking back to restaurant view
    @Binding var restaurantLinkActive: Bool
    
    //State bool for nav link forward to creating/viewing meal
    @State var mealViewLinkActive: Bool = false
    
    @State var linkType: LinkType = .addRestaurant
    
    @State private var mealToShow: Meal?
    
    var body: some View {

            VStack {
                List {
                    Group {
                        ForEach(meals) { meal in
                            Button {
                                //Change stuff and what not
                                linkType = .mealDetailView
                                self.mealToShow = meal
                                mealViewLinkActive.toggle()
                            } label: {
                                Text(meal.name)
                                    .foregroundColor(.black)
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
                    linkType = .addMeal
                    mealViewLinkActive.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            } .navigationDestination(isPresented: $mealViewLinkActive) {
                switch linkType {
                case .addMeal:
                    AddMealView(addMealLinkActive: $mealViewLinkActive)
                case .mealDetailView:
                    MealDetailView(meal: mealToShow)
                default:
                    RestaurantsView()
                }
                
            }
        
            .onAppear {
                if let currentRestaurant = DataControl.currentRestaurant {
                    meals = currentRestaurant.meals
                }
            }
        
        }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(restaurantLinkActive: Binding.constant(true))
    }
}
