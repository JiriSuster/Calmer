//
//  NotesContentView.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 30.05.2024.
//

import SwiftUI

struct NotesContentView: View {
    var body: some View {
        
        NavigationView {
                    VStack{
                        Text("Hello3")
                    }
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                                            Text("Notes")
                                .font(.largeTitle)
                                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {}){
                                Text("Add note")
                            }
                        }
                    }
                }
        
        
    }
}

#Preview {
    NotesContentView()
}
