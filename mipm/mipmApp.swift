//
//  mipmApp.swift
//  mipm
//
//  Created by 강진욱 on 2023/02/11.
//

import SwiftUI

@main
struct mipmApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
