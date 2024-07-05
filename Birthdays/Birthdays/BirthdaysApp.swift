//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Curtis on 2024/7/1.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
