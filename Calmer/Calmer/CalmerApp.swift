//
//  CalmerApp.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI

@main
struct CalmerApp: App {
    @StateObject private var dataController = CoreDataController()
    
    var body: some Scene {
        WindowGroup {
            TabsController(
                soundViewModel: SoundViewModel(moc: dataController.container.viewContext),
                noteViewModel: NoteViewModel(moc: dataController.container.viewContext)
            ).environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
