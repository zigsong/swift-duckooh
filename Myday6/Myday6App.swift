//
//  Myday6App.swift
//  Myday6
//
//  Created by songji on 2020/12/05.
//

import SwiftUI

@main
struct Myday6App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
