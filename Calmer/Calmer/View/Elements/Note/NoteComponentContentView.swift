//
//  NoteComponentContentViewf.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 06.06.2024.
//

import SwiftUI

struct NoteComponentContentView: View {
    @StateObject var noteViewModel: NoteViewModel
    @Binding var note: Note
    @State private var isShowingPopup = false
    
    @State private var editedName: String = ""
    @State private var editedMood: String = ""
    @State private var editedDescription: String = ""
    
    var truncatedName: String {
        if note.name?.count ?? 0 > 20 {
            return String(note.name?.prefix(20) ?? "") + "..."
        } else {
            return note.name ?? ""
        }
    }
    
    var truncatedDescription: String {
        if note.text?.count ?? 0 > 50 {
            return String(note.text?.prefix(50) ?? "") + "..."
        } else {
            return note.text ?? ""
        }
    }
    
    var body: some View {
        GroupBox {
            HStack {
                Text(note.mood ?? "😐")
                    .font(.system(size: 55))
                VStack(alignment: .leading) {
                    HStack {
                        Text(truncatedName).font(.system(size: 16))
                        Spacer()
                        Text(formattedDate(note.date)).foregroundColor(.gray)
                    }
                    Text(truncatedDescription).foregroundColor(.gray)
                        .font(.system(size: 14))
                }
            }
            .onTapGesture {
                editedName = note.name ?? ""
                editedDescription = note.text ?? ""
                editedMood = note.mood ?? "😐"
                isShowingPopup = true
            }
            .sheet(isPresented: $isShowingPopup, content: {
                PopupContentView(note: $note, editedName: $editedName,editedMood: $editedMood, editedDescription: $editedDescription, noteViewModel: noteViewModel, isShowingPopup: $isShowingPopup)
            })
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Config.shadowColor, radius: Config.shadowRadius)
        .padding(.horizontal,16)
    }
    
    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct PopupContentView: View {
    @State var selectedEmoji = "😐"
    @Binding var note: Note
    @Binding var editedName: String
    @Binding var editedMood: String
    @Binding var editedDescription: String
    @StateObject var noteViewModel: NoteViewModel
    @Binding var isShowingPopup: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Divider()
                HStack {
                    Text("Name")
                    Spacer().frame(width: 16)
                    TextField("Value", text: $editedName)
                }.padding(.horizontal, 16)
                Divider()
                SelectMoodComponentContentView(selectedEmoji: $selectedEmoji)
                Divider()
                VStack(alignment: .leading) {
                    Text("Description")
                    TextField("Value", text: $editedDescription, axis: .vertical)
                }.padding(.horizontal, 16)
                
                Spacer()
            }
            .padding(16)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isShowingPopup = false
                },
                trailing: Button("Save") {
                    note.name = editedName
                    note.text = editedDescription
                    note.mood = selectedEmoji
                    noteViewModel.save()
                    isShowingPopup = false
                }
            )
            .navigationBarTitle("Edit Note", displayMode: .inline)
            .onAppear{
                selectedEmoji = note.mood ?? "😐"
            }
        }
        .backgroundStyle(Color.white).shadow(color: Config.shadowColor, radius: Config.shadowRadius)
    }
}
