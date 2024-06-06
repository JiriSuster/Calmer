//
//  NoteViewModel.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 06.06.2024.
//

import SwiftUI
import CoreData

class NoteViewModel: ObservableObject {
    func saveNote(
        context: NSManagedObjectContext,
        name: String,
        text: String,
        mood: String
    ) {
        let newNote = Note(context: context)
        newNote.date = Date()
        newNote.name = name
        newNote.text = text
        newNote.mood = mood

        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
