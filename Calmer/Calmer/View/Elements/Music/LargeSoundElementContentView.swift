//
//  LargeSoundElementContentView.swift
//  Calmer
//
//  Created by David Krčmář on 31.05.2024.
//

import SwiftUI

struct LargeSoundElementContentView: View {
    let currentIndex: Int
    let soundItems: [SoundItem]
    @State var isViewPresented = false
    
    
    var body: some View {
        ZStack{
            VStack {
                
                Image(uiImage: soundItems[currentIndex].image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 130)
                
                Text("\(soundItems[currentIndex].name)")
                    .font(.headline)
                
                HStack{
                    
                    VStack(alignment: .leading){
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
                    }.padding(.horizontal,12)
                    Spacer()
                    
                    Button(action: {
                        isViewPresented.toggle()
                        print("Play button tapped for")
                    }) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                    }.padding(.horizontal,12)
                        .sheet(isPresented: $isViewPresented){
                            MusicPlayerContentView(isViewPresented: $isViewPresented, soundPlayerViewModel: SoundPlayerViewModel(currentIndex: self.currentIndex, soundItems: self.soundItems))
                                .presentationDetents([.fraction(0.75) , .large])
                        }
                    
                    
                }.padding(.vertical,5)
            }.onTapGesture {
                isViewPresented.toggle()
            }
            .padding(.vertical,3)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal,6)
            .frame(width: 180, height: 200)
        }.backgroundStyle(Color.white).shadow(color: Config.shadowColor, radius: Config.shadowRadius)
    }
}
