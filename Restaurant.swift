//
//  Restaurant.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import Foundation
import SwiftUI

struct Restaurant: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var meals: [Meal]
    var imageData: Data?
}
