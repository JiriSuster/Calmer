//
//  MainPageContentView.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI
import CoreData

struct MainPageContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var selectedEmoji = "😐"
    @State var moodData: [Mood] = []
    @State var monthResults: [MonthResult] = []
    @StateObject var mainPageViewModel: MainPageViewModel
    @StateObject var noteViewModel: NoteViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Config.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 8){
                    ChartElementContentView(monthResults: monthResults)
                    MoodCounterContentView(moodData: moodData)
                    SelectMoodComponentContentView(selectedEmoji: $selectedEmoji)
                    Button(action: {
                        mainPageViewModel.addEmptyNote(emoji: selectedEmoji)
                        moodData = mainPageViewModel.getMoodData()
                        monthResults = mainPageViewModel.getMonthlyMoodData()
                    }) {
                        Text("Save mood")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    .background(Config.buttonColor)
                    .cornerRadius(25)
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("Calmer")
        }.onAppear{
            moodData = mainPageViewModel.getMoodData()
            monthResults = mainPageViewModel.getMonthlyMoodData()
            selectedEmoji = noteViewModel.getLastMood() 
        }
    }
}

/*
#Preview {
    MainPageContentView()
}
*/
