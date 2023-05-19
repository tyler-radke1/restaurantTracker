//
//  MealsView.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Text("Your meals will go here")
                }
            }
            .background(Color.tanCustom)
            .scrollContentBackground(.hidden)
            .navigationTitle("Meals")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
