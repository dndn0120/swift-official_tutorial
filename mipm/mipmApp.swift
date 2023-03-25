//
//  mipmApp.swift
//  mipm
//
//  Created by 강진욱 on 2023/02/11.
//

import SwiftUI

@main
struct mipmApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
