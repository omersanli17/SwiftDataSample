//
//  iTour_SwiftDataApp.swift
//  iTour-SwiftData
//
//  Created by ömer şanlı on 28.01.2024.
//

import SwiftData
import SwiftUI

@main
struct iTour_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Destination.self)
    }
}
