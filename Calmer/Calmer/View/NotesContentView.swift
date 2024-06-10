//
//  NotesContentView.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI
import CoreData

struct NotesContentView: View {
    @StateObject var noteViewModel: NoteViewModel
    @State var notes: [Note] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NoteComponentContentView(
                        name: note.name ?? "Unnamed",
                        description: note.text ?? "none",
                        date: formattedDate(note.date),
                        emoji: note.mood ?? "😐"
                    ).listRowSeparator(.hidden)
                }
            }
            .backgroundStyle(Color.white)
            .listStyle(PlainListStyle())
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddNoteContentView(noteviewModel: noteViewModel)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Add Note")
                    }
                }
            }
        }.onAppear{
            notes = noteViewModel.fetchNotes()
        }
    }

    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

