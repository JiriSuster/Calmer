//
//  Chart.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//

import SwiftUI
import Charts

struct MonthResult: Identifiable {
    let id = UUID()
    let month: String
    let value: Int
    let color: Color
}

struct ChartElementContentView: View {
    let monthResults: [MonthResult]
    
    var averageValue: Double {
        let nonZeroValues = monthResults.filter { $0.value != 0 }
        guard !nonZeroValues.isEmpty else {
            return 0
        }
        let total = nonZeroValues.reduce(0.0) { $0 + Double($1.value) }
        return total / Double(nonZeroValues.count)
    }
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Month results")
                    .font(.body)

                Chart {
                    RuleMark(y: .value("Average", averageValue))
                        .lineStyle(StrokeStyle(lineWidth: 2))
                        .foregroundStyle(Color.red)

                    ForEach(monthResults) { result in
                        BarMark(
                            x: .value("Month", result.month),
                            y: .value("Value", result.value),
                            width: 15
                        )
                        .foregroundStyle(result.color)
                    }
                }
                .frame(height: 150)
                .chartXAxis(.hidden)
                .chartYAxis(.hidden)
            }
        }
        .padding(.horizontal, 16)
        .backgroundStyle(Color.white)
        .shadow(color: Config.shadowColor, radius: Config.shadowRadius)
    }
}



#Preview {
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
}

