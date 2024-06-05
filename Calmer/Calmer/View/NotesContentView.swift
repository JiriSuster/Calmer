//
//  NotesContentView.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI

struct NotesContentView: View {
    var body: some View {
        
        NavigationView {
                    VStack{
                        NoteComponentContentView(name: "Awesome", description: "Morning yoga session in the garden, followed by...", date: "13. Sep", emoji: "🥰")
                        NoteComponentContentView(name: "Terrible", description: "Morning yoga session in the garden, followed by...", date: "13. Sep", emoji: "🤢")
                        NoteComponentContentView(name: "Sad", description: "Morning yoga session in the garden, followed by...", date: "13. Sep", emoji: "😢")
                    }
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                                            Text("Notes")
                                .font(.largeTitle)
                                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            NavigationLink{
                                AddNoteContentView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("add note")
                            }
                        }
                    }
                }
    }
}

#Preview {
    NotesContentView()
}
