//
//  NotesContentView.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI
import CoreData

struct NotesContentView: View {
    @ObservedObject var noteViewModel: NoteViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(noteViewModel.notes, id: \.self) { note in
                    NoteComponentContentView(
                        noteViewModel: noteViewModel,
                        note: .constant(note)
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
                        Text(noteViewModel.isLastNoteFromToday() ? "Edit Note" : "Add Note")
                    }
                }
            }
        }
        .onAppear {
            noteViewModel.fetchNotes()
        }
    }

    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
