//
//  MoodCounterContentView.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//

import SwiftUI
import Charts


struct Mood: Identifiable {
    let id = UUID()
    let moodType: String
    let count: Int
}


struct MoodCounterContentView: View {
    let moodData: [Mood]

    var body: some View {
        GroupBox{
            VStack(alignment: .leading){
                Text("Mood Counter").font(.body)
                Chart(moodData) { mood in
                    BarMark(
                        x: .value("Mood", mood.moodType),
                        y: .value("Count", mood.count)
                    )
                    .foregroundStyle(by: .value("Mood", mood.moodType))
                }
                .chartForegroundStyleScale([
                    "Happy": .green,
                    "Neutral": .blue,
                    "Satisfied": .yellow,
                    "Disappointed": .orange,
                    "Sad": .red
                ])
                .frame(height: 100)
                .padding()
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
                .chartLegend(.hidden)
            }
        }.padding(.horizontal, 16).backgroundStyle(Color.white).shadow(color: StyleConfig.shadowColor, radius: StyleConfig.shadowRadius)
    }
}


struct MoodCounterChart_Previews: PreviewProvider {
    static var previews: some View {
        MoodCounterContentView(moodData: [
            Mood(moodType: "Happy", count: 10),
            Mood(moodType: "Neutral", count: 5),
            Mood(moodType: "Satisfied", count: 15),
            Mood(moodType: "Disappointed", count: 7),
            Mood(moodType: "Sad", count: 20)
        ])
    }
}
