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
    @StateObject var mainPageViewModel: MainPageViewModel
    @StateObject var noteViewModel: NoteViewModel

    var body: some View {
        
        NavigationView {
            ZStack {
                StyleConfig.backgroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 8){
                    ChartElementContentView(monthResults:  [
                        MonthResult(month: "Jan", value: 5, color: .orange),
                        MonthResult(month: "Feb", value: 7, color: .orange),
                        MonthResult(month: "Mar", value: 6, color: .orange),
                        MonthResult(month: "Apr", value: 9, color: .orange),
                        MonthResult(month: "May", value: 4, color: .blue),
                        MonthResult(month: "Jun", value: 8, color: .blue),
                        MonthResult(month: "Jul", value: 5, color: .blue),
                        MonthResult(month: "Aug", value: 7, color: .orange),
                        MonthResult(month: "Sep", value: 6, color: .orange),
                        MonthResult(month: "Oct", value: 8, color: .orange),
                        MonthResult(month: "Nov", value: 7, color: .orange),
                        MonthResult(month: "Dec", value: 9, color: .orange),
                    ])
                    MoodCounterContentView(moodData: moodData)
                    SelectMoodComponentContentView(selectedEmoji: $selectedEmoji)
                    Button(action: {
                        mainPageViewModel.addEmptyNote(emoji: selectedEmoji)
                        moodData = mainPageViewModel.getMoodData()
                    }) {
                        Text("Save mood")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                    .background(StyleConfig.buttonColor)
                    .cornerRadius(25)
                    .padding(.horizontal)
                    
                }
            }
            .navigationBarTitle("Calmer")
        }.onAppear{
            moodData = mainPageViewModel.getMoodData()
        }
        
    }

}

/*
#Preview {
    MainPageContentView()
}
*/
