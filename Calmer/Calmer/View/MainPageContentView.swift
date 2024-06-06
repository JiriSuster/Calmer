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
                    ChartElementContentView()
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
