//
//  TabController.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

struct TabsController: View {
    var body: some View {
        TabView {
            MusicContentView()
                .tabItem {
                    Label("Music", systemImage: "music.note")
                }
            NotesContentView()
                .tabItem {
                    Label("Notes", systemImage: "note")
                }
            MainPageContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AnimationContentView()
                .tabItem {
                    Label("Breathing", systemImage: "wind")
                }
            ContactsContentView()
                .tabItem {
                    Label("Contacts", systemImage: "phone")
                }
        }
    }
}

#Preview {
    TabsController()
}
