//
//  NeemiracleApp.swift
//  Neemiracle
//
//  Created by Erkebulan Massainov on 01.09.2024.
//

import SwiftUI
import SwiftData

@main
struct NeemiracleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
        
    }
}
