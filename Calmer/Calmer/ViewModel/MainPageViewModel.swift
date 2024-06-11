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
        let notes = noteViewModel.fetchNotes()
        var moodCounts: [String: Int] = ["🤢":0,"😢":0,"😐":0,"😊":0,"🥰":0]
        for note in notes {
            let mood = note.mood
            moodCounts[mood ?? "", default: 0] += 1
        }
        print(moodCounts)
        moodData = moodCounts.map { Mood(moodType: $0.key, count: $0.value) }
        moodData = moodData.sorted { $0.moodType < $1.moodType }
        moodData.swapAt(0,3)
        moodData.swapAt(1, 2) //swaping to match emojis
        return moodData
    }
    
    func getMonthlyMoodData() -> [MonthResult] {
        let notes = noteViewModel.fetchNotes()
        
        let currentYear = Calendar.current.component(.year, from: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        let monthOrder = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        var monthlyMoodCounts: [String: [String: Int]] = [:]
        
        for month in monthOrder {
            monthlyMoodCounts[month] = ["": 0]
        }
        
        let notesForCurrentYear = notes.filter { note in
            guard let date = note.date else { return false }
            return Calendar.current.component(.year, from: date) == currentYear
        }
        
        for note in notesForCurrentYear {
            if let date = note.date, let mood = note.mood {
                let month = dateFormatter.string(from: date)
                monthlyMoodCounts[month, default: [:]][mood, default: 0] += 1
            }
        }
        
        var monthResults: [MonthResult] = []
        for month in monthOrder {
            if let moods = monthlyMoodCounts[month] {
                let maxMood = moods.max { $0.value < $1.value }
                let maxMoodCount = maxMood?.value ?? 0
                let color = getColor(for: maxMood?.key ?? "")
                monthResults.append(MonthResult(month: month, value: maxMoodCount, color: color))
            }
        }
        return monthResults
    }



    
    func getColor(for mood: String) -> Color {
        switch mood {
        case "🤢":
            return .green
        case "😢":
            return .blue
        case "😐":
            return .yellow
        case "😊":
            return .orange
        case "🥰":
            return .red
        default:
            return .orange
        }
    }
    
    func addEmptyNote(emoji: String) {
        noteViewModel.saveNote(context: moc, name: "Set name", text: "Set description", mood: emoji)
    }
}
