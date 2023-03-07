//
//  BhagavadGeetaApp.swift
//  BhagavadGeeta
//
//  Created by AkhileshSingh on 07/03/23.
//

import SwiftUI

@main
struct BhagavadGeetaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
