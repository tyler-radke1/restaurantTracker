//
//  Restaurant_TrackerApp.swift
//  Restaurant Tracker
//
//  Created by Tyler Radke on 5/18/23.
//

import SwiftUI

@main
struct Restaurant_TrackerApp: App {
    let persistence = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            RestaurantsView(persistence: persistence).environmentObject(persistence)
        }
    }
}
