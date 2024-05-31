//
//  TabController.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

struct TabsController: View {
    @State private var selection = 3
    
    var body: some View {
        TabView(selection: $selection) {
            MusicContentView()
                .tabItem {
                    Label("Music", systemImage: "music.note")
                }.tag(1)
            NotesContentView()
                .tabItem {
                    Label("Notes", systemImage: "note")
                }.tag(2)
            MainPageContentView()
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

#Preview {
    TabsController()
}
