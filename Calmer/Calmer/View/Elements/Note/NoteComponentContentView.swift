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
    var body: some View {
        GroupBox {
            HStack {
                Text(emoji)
                    .font(.system(size: 55))
                VStack(alignment: .leading) {
                    HStack {
                        Text(name).font(.system(size: 16))
                        Spacer()
                        Text(date).foregroundColor(.gray)
                    }
                    Text(description).foregroundColor(.gray)
                        .font(.system(size: 14))
                }
            }
        }.padding(.horizontal,20).backgroundStyle(Color.white).shadow(color: StyleConfig.shadowColor, radius: StyleConfig.shadowRadius)
    }
}


#Preview {
    NoteComponentContentView(name: "Awesome", description: "Morning yoga session in the garden, followed by...", date: "13. Sep", emoji: "🥰")
}
