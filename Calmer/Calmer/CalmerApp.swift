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
        let noteViewModel = NoteViewModel(moc: dataController.container.viewContext)
        WindowGroup {
            TabsController(
                soundViewModel: SoundViewModel(moc: dataController.container.viewContext),
                noteViewModel: noteViewModel,
                mainPageViewModel: MainPageViewModel(moc: dataController.container.viewContext,noteViewModel: noteViewModel)
            ).environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
