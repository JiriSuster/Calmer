//
//  SelectMoodContentView.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//

import SwiftUI

struct SelectMoodComponentContentView: View {
    @Binding var selectedEmoji: String

    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Select your today's mood")
                HStack {
                    ForEach(["🤢", "😢", "😐", "😊", "🥰"], id: \.self) { emoji in
                        Button(action: {
                            self.selectedEmoji = emoji
                        }) {
                            Text(emoji)
                                .font(.system(size: 55))
                                .opacity(selectedEmoji == emoji ? 1.0 : 0.3)
                        }
                    }
                }
            }
        }.backgroundStyle(Color.white).shadow(color: StyleConfig.shadowColor, radius: StyleConfig.shadowRadius)
    }
}

#Preview {
    SelectMoodComponentContentView(selectedEmoji: .constant("😐"))
}
