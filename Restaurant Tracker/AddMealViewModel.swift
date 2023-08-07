//
//  AddMealViewModel.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 8/6/23.
//

import Foundation
import SwiftUI

extension AddMealView {
    @MainActor class AddMealViewModel {
        @Published var mealName: String = ""
        
        @Published var likeMeal: Bool = false
        
        @Published var notes: String = ""
    }
}

