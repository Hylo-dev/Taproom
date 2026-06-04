//
//  TaproomApp.swift
//  Taproom
//
//  Created by C4V4H.exe on 21/05/2026.
//

import SwiftUI
import SwiftData

@main
struct TaproomApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
		.modelContainer(for: [
			BrewPackage.self,
			BrewCatalogMetadata.self
		])
    }
}
