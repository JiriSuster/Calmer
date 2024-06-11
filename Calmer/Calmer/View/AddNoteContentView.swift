//
//  AddNoteContentView.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//
import SwiftUI

struct AddNoteContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var noteviewModel : NoteViewModel
    @State private var name: String = ""
    @State private var text: String = ""
    @State private var selectedEmoji: String = "😐"
    @State private var navigateBack = false

    var body: some View {
        NavigationView {
            ZStack {
                StyleConfig.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Name")
                        TextField("Value", text: $name)
                    }
                    SelectMoodComponentContentView(selectedEmoji: $selectedEmoji)
                    HStack {
                        Text("Description")
                        TextField("Placeholder", text: $text, axis: .vertical).padding(10)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink {
                            NotesContentView(noteViewModel: noteviewModel).navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("New note")
                            .font(.body)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            noteviewModel.saveNote(
                                context: viewContext,
                                name: name,
                                text: text,
                                mood: selectedEmoji
                            )
                            navigateBack = true
                        }
                    }
                }
                .background(
                                NavigationLink(
                                    destination: NotesContentView(noteViewModel: noteviewModel).navigationBarBackButtonHidden(true),
                                    isActive: $navigateBack,
                                    label: { EmptyView() }
                                )
                            )
                .backgroundStyle(Color.white).shadow(color: StyleConfig.shadowColor, radius: StyleConfig.shadowRadius)
            }
        }
    }
}
