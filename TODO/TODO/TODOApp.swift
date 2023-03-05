//
//  TODOApp.swift
//  TODO
//
//  Created by AkhileshSingh on 04/03/23.
//

import SwiftUI

@main
struct TODOApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(DataStore())
        }
    }
}
