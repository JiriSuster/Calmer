
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
     
     init(moc: NSManagedObjectContext) {
         self.moc = moc
     }

     
     func fetchNotes() -> [Note]{
         let request = NSFetchRequest<Note>(entityName: "Note")
         var notes: [Note] = []
         
         do{
             notes = try moc.fetch(request)
         }catch{
             print("Some error occured while fetching")
         }
         return notes.reversed()
         
     }
     
     
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
         save()
     }
     
     func save(){
         if moc.hasChanges{
             do{
                 try moc.save()
             } catch {
                 print("Cannot save MOC: \(error.localizedDescription)")
             }
         }
     }
     
 }
