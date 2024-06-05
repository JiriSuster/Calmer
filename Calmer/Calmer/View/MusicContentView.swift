//
//  MusicContentView.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
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
                    LargeSoundElementContentView(currentIndex: 0, soundItems: soundViewModel.soundItems)
                    LargeSoundElementContentView(currentIndex: 1, soundItems: soundViewModel.soundItems)
                }.padding(.horizontal,6).padding(.vertical,12)
                
                Text("Sounds")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,12)
                VStack{
                    SoundElementContentView(currentIndex: 2, soundItems: soundViewModel.soundItems)
                    SoundElementContentView(currentIndex: 3, soundItems: soundViewModel.soundItems)
                    SoundElementContentView(currentIndex: 4, soundItems: soundViewModel.soundItems)
                }
                
                
            }.navigationTitle("Relaxation Music")
        }
        
    }
}

//#Preview {
//    MusicContentView()
//}
