//
//  MealsView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct MealsView: View {
   @StateObject var viewModel = MealsViewModel()
    
    @State var currentRestaurant: Restaurant = Restaurant(name: "Default", meals: [])
    
    init(restaurant: Restaurant) {
        self._currentRestaurant = State(wrappedValue: restaurant)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.currentRestaurant.meals) { meal in
                    Button {
                        viewModel.mealTapped(meal: meal)
                    } label: {
                        Text(meal.name)
                            .foregroundColor(.black)
                    }
                }
                .onDelete { indexSet in
                    viewModel.delete(at: indexSet)
                }
                
                if viewModel.meals.isEmpty {
                    HStack {
                        Spacer()
                        Text("Add some meals from this restaurant to see them here!")
                        Spacer()
                    }
                    
                }
            }
        }
        .background(Color.tanCustom)
        .scrollContentBackground(.hidden)
        .navigationTitle("Meals")
        .toolbar {
            Button {
              //  viewModel.mealViewLinkActive.toggle()
                viewModel.addMealLinkActive.toggle()
            } label: {
                Image(systemName: "plus")
            }
            
        } .navigationDestination(isPresented: $viewModel.addMealLinkActive, destination: {
            AddMealView(currentRestaurant: $viewModel.currentRestaurant, addMealLinkActive: $viewModel.addMealLinkActive)
        })
        
        .navigationDestination(isPresented: $viewModel.mealDetailViewLinkActive, destination: {
            MealDetailView(restaurant: $viewModel.currentRestaurant, meal: viewModel.mealToShow ?? Meal(name: "default", likeMeal: false, notes: "hello"))
        })
    
        .onAppear {
            viewModel.currentRestaurant = self.currentRestaurant
            viewModel.meals = viewModel.currentRestaurant.meals
        }
        
    }
}

//struct MealsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealsView(restaurantLinkActive: Binding.constant(true), currentRestaurant: bind)
//    }
//}
