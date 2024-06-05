//
//  MainPageContentView.swift
//  Calmer
//
//  Created by David Krčmář on 30.05.2024.
//

import SwiftUI


struct MainPageContentView: View {
    var body: some View {
        
        NavigationView {
                    Form{
                        Text("main")
                    }
                    .navigationBarTitle("Calmer")
                }
        
    }
}

#Preview {
    MainPageContentView()
}
