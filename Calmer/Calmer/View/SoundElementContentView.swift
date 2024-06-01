//
//  SoundElementContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 31.05.2024.
//

import SwiftUI

struct SoundElementContentView: View {
    let currentIndex: Int
    let soundItems: [SoundItem]
    @State var isViewPresented = false
    
    
    var body: some View {
        HStack {
                    
            Image(uiImage: soundItems[currentIndex].image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 80)
            
                    VStack(alignment: .leading) {
                        Text("\(soundItems[currentIndex].name)")
                            .font(.headline)
                            .padding(.bottom, 2)
                        Text("\(soundItems[currentIndex].category)")
                            .font(.caption)
                            .padding(.horizontal,12)
                            .padding(.vertical,8)
                            .background(
                                    RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.indigo.opacity(0.5))
                                        )
                            .foregroundColor(.white)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal,40)
                    
                    Spacer()
                    
                    Button(action: {
                        isViewPresented.toggle()
                        print("Play button tapped for")
                    }) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                    }.sheet(isPresented: $isViewPresented){
                        MusicPlayerContentView(isViewPresented: $isViewPresented, soundPlayerViewModel: SoundPlayerViewModel(currentIndex: self.currentIndex, soundItems: self.soundItems))
                            .presentationDetents([.fraction(0.75) , .large])
                    }
                    .padding()
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .onTapGesture {
                    isViewPresented.toggle()
                }.padding(.horizontal,6).padding(.vertical,3)
        
    }
}

