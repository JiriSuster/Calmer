//
//  MainPageContentView.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI


struct MainPageContentView: View {
    @State var selectedEmoji = "😐"
    var body: some View {
        
        NavigationView {
            VStack{
                ChartElementContentView()
                MoodCounterContentView(moodData: [
                    Mood(moodType: "Happy", count: 10),
                    Mood(moodType: "Neutral", count: 5),
                    Mood(moodType: "Satisfied", count: 15),
                    Mood(moodType: "Disappointed", count: 7),
                    Mood(moodType: "Sad", count: 20)
                ])
                SelectMoodContentView()
                Button("Save mood") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
                    .navigationBarTitle("Calmer")
                }
        
    }
}

#Preview {
    MainPageContentView()
}
