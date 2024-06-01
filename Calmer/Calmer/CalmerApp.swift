//
//  CalmerApp.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

@main
struct CalmerApp: App {
    @StateObject private var dataController = CoreDataController()
    
    var body: some Scene {
        WindowGroup {
                        TabsController(soundViewModel: SoundViewModel(moc: dataController.container.viewContext))
                            .environment(\.managedObjectContext, dataController.container.viewContext)
                    }

    }
}
