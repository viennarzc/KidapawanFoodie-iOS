//
//  KidapawanFoodieApp.swift
//  KidapawanFoodie
//
//  Created by Viennarz Curtiz on 4/14/22.
//

import SwiftUI

@main
struct KidapawanFoodieApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            ExploreView()
        }
    }
}
