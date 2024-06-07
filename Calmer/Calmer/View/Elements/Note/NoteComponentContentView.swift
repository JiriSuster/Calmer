//
//  NoteComponentContentView.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//

import SwiftUI

struct NoteComponentContentView: View {
    let name: String
    let description: String
    let date: String
    let emoji: String
    
    var truncatedName: String {
        if name.count > 20 {
            return String(name.prefix(20)) + "..."
        } else {
            return name
        }
    }
    
    var truncatedDescription: String {
        if description.count > 50 {
            return String(description.prefix(50)) + "..."
        } else {
            return description
        }
    }
    
    
    var body: some View {
        GroupBox {
            HStack {
                Text(emoji)
                    .font(.system(size: 55))
                VStack(alignment: .leading) {
                    HStack {
                        Text(truncatedName).font(.system(size: 16))
                        Spacer()
                        Text(date).foregroundColor(.gray)
                    }
                    Text(truncatedDescription).foregroundColor(.gray)
                        .font(.system(size: 14))
                }
            }
        }
        .padding(.horizontal, 20)
        .background(Color.white)
        .shadow(color: StyleConfig.shadowColor, radius: StyleConfig.shadowRadius)
    }
}

#Preview {
    NoteComponentContentView(name: "This is a very long note name that should be truncated", description: "This description is also quite long and needs to be truncated after fifty characters", date: "13. Sep", emoji: "🥰")
}
