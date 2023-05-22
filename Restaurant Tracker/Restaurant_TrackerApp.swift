//
//  Restaurant_TrackerApp.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

@main
struct Restaurant_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            RestaurantsView(persistence: PersistenceController.shared)
        }
    }
}
