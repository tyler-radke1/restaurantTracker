//
//  Meal.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import Foundation
import SwiftUI

struct Meal: Identifiable, Codable {
    let id: UUID = UUID()
    var name: String
}
