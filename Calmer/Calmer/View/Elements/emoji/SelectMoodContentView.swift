//
//  SelectMoodContentView.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 05.06.2024.
//

import SwiftUI

struct SelectMoodContentView: View {
    @State var selectedEmoji = "😐"
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Select your mood")
                
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
        }
    }
}

#Preview {
    SelectMoodContentView()
}