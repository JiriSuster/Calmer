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
                isShowingPopup = true
            }
            .sheet(isPresented: $isShowingPopup, content: {
                PopupContentView(note: $note, editedName: $editedName, editedDescription: $editedDescription, noteViewModel: noteViewModel, isShowingPopup: $isShowingPopup)
            })
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: StyleConfig.shadowColor, radius: StyleConfig.shadowRadius)
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
    @Binding var note: Note
    @Binding var editedName: String
    @Binding var editedDescription: String
    @StateObject var noteViewModel: NoteViewModel
    @Binding var isShowingPopup: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $editedName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer().frame(height: 20)
                TextEditor(text: $editedDescription)
                    .border(Color.gray, width: 1)
                    .padding()
                Spacer()
            }
            .navigationBarItems(
                leading: Button("Cancel") {
                    isShowingPopup = false
                },
                trailing: Button("Save") {
                    note.name = editedName
                    note.text = editedDescription
                    //note.date = Date()
                    noteViewModel.save()
                    isShowingPopup = false
                }
            )
            .navigationBarTitle("Edit Note", displayMode: .inline)
        }
        .background(Color.white)
        .padding()
    }
}
