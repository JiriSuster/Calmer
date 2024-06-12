
//
 //  NoteViewModel.swift
 //  Calmer
 //
 //  Created by Jiří Daniel Šuster on 06.06.2024.
 //

 import SwiftUI
 import CoreData

class NoteViewModel: ObservableObject {
    private var moc: NSManagedObjectContext
    @Published var notes: [Note] = []
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
        fetchNotes()
    }
    
    func fetchNotes() {
        let request = NSFetchRequest<Note>(entityName: "Note")
        do {
            notes = try moc.fetch(request).reversed()
        } catch {
            print("Some error occurred while fetching")
        }
    }
    
    func saveNote(
        name: String?,
        text: String?,
        mood: String
    ) {
        let isLastNoteFromToday = Calendar.current.isDateInToday(getLastDate())
        if(name == nil && text == nil && isLastNoteFromToday){
            editLastMood(mood: mood)
        }
        else{
            if(!isLastNoteFromToday){
                let newNote = Note(context: moc)
                newNote.date = Date()
                newNote.name = name ?? "Set name"
                newNote.text = text ?? "Set description"
                newNote.mood = mood
                newNote.id = UUID()
            } else {
                if let lastNote = notes.first {
                    lastNote.name = name
                    lastNote.text = text
                    lastNote.mood = mood
                }
            }
        }
        save()
        fetchNotes()
    }
    
    func getLastMood() -> String {
        return notes.first?.mood ?? ""
    }
    
    func editLastMood(mood: String) {
        if let lastNote = notes.first {
            lastNote.mood = mood
            save()
            fetchNotes()
        }
    }
    
    func getLastDate() -> Date {
        return notes.first?.date ?? Date().addingTimeInterval(-10000000000)
    }
    
    func editLastNote(name: String, description: String) {
        if let lastNote = notes.first {
            lastNote.name = name
            lastNote.text = description
            save()
            fetchNotes()
        }
    }
    
    func save() {
        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                print("Cannot save MOC: \(error.localizedDescription)")
            }
        }
    }
}
