//
//  AddNoteContentView.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//
import SwiftUI

struct AddNoteContentView: View {
    @StateObject var noteviewModel: NoteViewModel
    @State private var name: String = ""
    @State private var text: String = ""
    @State private var selectedEmoji: String = "😐"
    @State private var navigateBack = false

    var body: some View {
        NavigationView {
            ZStack {
                Config.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Divider()
                    HStack {
                        Text("Name")
                        Spacer().frame(width: 16)
                        TextField("Value", text: $name)
                    }.padding(.horizontal, 16)
                    Divider()
                    SelectMoodComponentContentView(selectedEmoji: $selectedEmoji)
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Description")
                        TextField("Value", text: $text, axis: .vertical)
                    }.padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .onAppear {
                    selectedEmoji = noteviewModel.getLastMood()
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
                                name: name.isEmpty ? nil : name,
                                text: text.isEmpty ? nil : text,
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
                .backgroundStyle(Color.white).shadow(color: Config.shadowColor, radius: Config.shadowRadius)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
