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
                    MoodCounterContentView(moodData: [
                        Mood(moodType: "Happy", count: 10),
                        Mood(moodType: "Neutral", count: 5),
                        Mood(moodType: "Satisfied", count: 15),
                        Mood(moodType: "Disappointed", count: 7),
                        Mood(moodType: "Sad", count: 20)
                    ])
                    SelectMoodComponentContentView()
                    Button(action: {
                                // Your action here
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
                }
        
    }
}

#Preview {
    MainPageContentView()
}
