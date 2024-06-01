//
//  LargeSoundElementContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 31.05.2024.
//

import SwiftUI

struct LargeSoundElementContentView: View {
    let soundParameters: SoundItem
    @State var isViewPresented = false
    
    
    var body: some View {
        VStack {

            
            Image(uiImage: soundParameters.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 130)
                
            Text("\(soundParameters.name)")
                .font(.headline)
            
            HStack{
                
                VStack(alignment: .leading){
                    Text("\(soundParameters.category)")
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
                        MusicPlayerContentView(soundParameters: soundParameters, isViewPresented: $isViewPresented, soundPlayerViewModel: SoundPlayerViewModel(soundParameters: soundParameters))
                            .presentationDetents([.fraction(0.75) , .large])
                    }
                                
                
            }.padding(.vertical,5)
            }.onTapGesture {
                isViewPresented.toggle()
            }
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal,6)
                .frame(width: 180, height: 200)
    }
}
