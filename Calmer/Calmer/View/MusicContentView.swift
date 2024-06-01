//
//  MusicContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

struct MusicContentView: View {
    @StateObject var soundViewModel: SoundViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Music")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,12)
                
                HStack{
                    LargeSoundElementContentView(soundParameters: soundViewModel.soundItems[0])
                    LargeSoundElementContentView(soundParameters: soundViewModel.soundItems[1])
                }.padding(.horizontal,6).padding(.vertical,12)
                
                Text("Sounds")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,12)
                VStack{
                    SoundElementContentView(soundParameters: soundViewModel.soundItems[2])
                    SoundElementContentView(soundParameters: soundViewModel.soundItems[3])
                    SoundElementContentView(soundParameters: soundViewModel.soundItems[4])
                }
                
                
            }.navigationTitle("Relaxation Music")
        }
        
    }
}

//#Preview {
//    MusicContentView()
//}
