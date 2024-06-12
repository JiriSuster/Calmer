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
        GroupBox {
            VStack(alignment: .leading) {
                Text("Mood Counter").font(.body)
                if(moodData.contains { $0.count > 0 }){
                    Chart(moodData) { mood in
                        BarMark(
                            x: .value("Mood", mood.moodType),
                            y: .value("Count", mood.count)
                        )
                        .foregroundStyle(by: .value("Mood", mood.moodType))
                    }
                    .chartForegroundStyleScale([
                        "🤢": .green,
                        "😢": .blue,
                        "😐": .yellow,
                        "😊": .orange,
                        "🥰": .red
                    ])
                    .frame(height: 100)
                    .padding()
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .chartLegend(.hidden)
                } else {
                    Text("Add your first mood 😊")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .padding(.horizontal, 16)
        .backgroundStyle(Color.white)
        .shadow(color: Config.shadowColor, radius: Config.shadowRadius)
    }
}

struct MoodCounterChart_Previews: PreviewProvider {
    static var previews: some View {
        MoodCounterContentView(moodData: [
            Mood(moodType: "🤢", count: 5),
            Mood(moodType: "😢", count: 5),
            Mood(moodType: "😐", count: 15),
            Mood(moodType: "😊", count: 7),
            Mood(moodType: "🥰", count: 20)
        ])
    }
}
