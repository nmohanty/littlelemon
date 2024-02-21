//
//  RestaurantApp.swift
//  Restaurant
//
//  Created by namrata mohanty on 1/29/24.
//

import SwiftUI
import CoreData

@main
struct RestaurantApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
