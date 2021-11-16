//
//  ios_projApp.swift
//  ios_proj
//
//  Created by Бекдаулет Казбеков on 16.11.2021.
//

import SwiftUI

@main
struct ios_projApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
