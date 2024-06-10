//
//  TabController.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI

struct TabsController: View {
    @State private var selection = 3
    @StateObject var soundViewModel: SoundViewModel
    @StateObject var noteViewModel: NoteViewModel
    @StateObject var mainPageViewModel: MainPageViewModel
        
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var pois: FetchedResults<MusicDb>
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    
    var body: some View {
        TabView(selection: $selection) {
            MusicContentView(soundViewModel: .init(moc: moc))
                .tabItem {
                    Label("Music", systemImage: "music.note")
                }.tag(1)
            NotesContentView(noteViewModel: .init(moc: moc))
                .tabItem {
                    Label("Notes", systemImage: "note")
                }.tag(2)
            MainPageContentView(mainPageViewModel: .init(moc: moc,noteViewModel: noteViewModel), noteViewModel: .init(moc: moc))
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag(3)
            AnimationContentView()
                .tabItem {
                    Label("Breathing", systemImage: "wind")
                }.tag(4)
            ContactsContentView()
                .tabItem {
                    Label("Contacts", systemImage: "phone")
                }.tag(5)
        }
    }
}

//#Preview {
//    TabsController()
//}
