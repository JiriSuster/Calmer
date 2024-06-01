//
//  MusicPlayerContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 31.05.2024.
//

import SwiftUI
import AVFoundation

struct MusicPlayerContentView: View {
    let soundParameters: SoundItem
    @Binding var isViewPresented: Bool
   
    @StateObject var soundPlayerViewModel: SoundPlayerViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                
                VStack{
                    Image(uiImage: soundParameters.image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .clipped()
                        .cornerRadius(20)
                }.frame(width: 200,height: 240).padding(.vertical,10)
                
                Spacer()

                Slider(value: $soundPlayerViewModel.currentTime,
                       in: 0...TimeInterval(soundPlayerViewModel.getDuration()),
                       step: 1,
                       onEditingChanged: { editing in
                        soundPlayerViewModel.isDragging = editing
                        if !editing {
                            soundPlayerViewModel.setCurrentTime(soundPlayerViewModel.currentTime)
                        }
                }).padding()
                
                HStack{
                    Text(soundPlayerViewModel.getFormatedCurrentTime()).foregroundStyle(.gray)
                    Spacer()
                    Text(soundPlayerViewModel.getFormatedDuration()).foregroundStyle(.gray)
                }.padding(.horizontal,20)
                
                Button(action: {
                    if soundPlayerViewModel.isMusicPlaying() {
                        soundPlayerViewModel.pauseSound()
                    }else{
                        soundPlayerViewModel.playSound()
                    }
                }) {
                    Image(systemName: soundPlayerViewModel.isMusicPlaying() ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.black)
                }.padding()

            }.navigationTitle(soundParameters.name)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button(action: {isViewPresented.toggle()}){
                            Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            Text("Back")
                        }
                    }
                }
                .onAppear(){
                    soundPlayerViewModel.playSound()
                }
        
            
        }
    }
    
}
