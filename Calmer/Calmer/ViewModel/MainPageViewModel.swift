//
//  MainPageViewModel.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 10.06.2024.
//

import SwiftUI
import CoreData

class MainPageViewModel: ObservableObject {
    private var moc: NSManagedObjectContext
    var noteViewModel: NoteViewModel

    
    init(moc: NSManagedObjectContext, noteViewModel : NoteViewModel) {
        self.moc = moc
        self.noteViewModel = noteViewModel
    }
    func getMoodData() -> [Mood] {
        var moodData: [Mood] = []
        let noteViewModel = NoteViewModel(moc: moc)     
        let notes = noteViewModel.fetchNotes()
        var moodCounts: [String: Int] = ["🤢":0,"😢":0,"😐":0,"😊":0,"🥰":0]
        
        for note in notes {
            let mood = note.mood
            moodCounts[mood ?? "", default: 0] += 1
        }
        print(moodCounts)
        
        
        moodData = moodCounts.map { Mood(moodType: $0.key, count: $0.value) }
        moodData = moodData.sorted { First, Second in
            return First.moodType < Second.moodType
        }
        moodData.swapAt(0,3)
        moodData.swapAt(1, 2)
        return moodData
    }
    
    func addEmptyNote(emoji: String){
        noteViewModel.saveNote(context: moc, name: "Set name", text: "Set description", mood: emoji)
    }
    
}
