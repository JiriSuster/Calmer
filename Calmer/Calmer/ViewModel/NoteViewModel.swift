
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
         name: String,
         text: String,
         mood: String
     ) {
         let isLastNoteFromToday = Calendar.current.isDateInToday(getLastDate())
         print("is last note from today?")
         print(isLastNoteFromToday)
         if(!isLastNoteFromToday){
             let newNote = Note(context: moc)
             newNote.date = Date() - (0 * 3000000) //odecitani mesicu, pouze pro ukazku u obhajoby
             newNote.name = name
             newNote.text = text
             newNote.mood = mood
             newNote.id = UUID()
         }
         else{
             let notes = fetchNotes()
             let lastNote = notes.first
             lastNote?.name = name
             lastNote?.text = text
             lastNote?.mood = mood
         }
         save()
     }
     
     func getLastMood() -> String{
         let notes = fetchNotes()
         return notes.first?.mood ?? ""
     }
     
     func editLastMood(mood: String){ //funguje
             let notes = fetchNotes()
             notes.first?.mood = mood
             save()
         }
         
     func getLastDate() -> Date{
             let notes = fetchNotes()
             return notes.first?.date ?? Date() - 10000000000
         }
         
     func editLastNote(name: String, description: String){
             let notes = fetchNotes()
             notes.first?.name = name
             notes.first?.text = description
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
