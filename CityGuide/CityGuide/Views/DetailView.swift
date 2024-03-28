//
//  DetailView.swift
//  CityGuide
//
//  Created by David Krčmář on 28.03.2024.
//

import SwiftUI



struct DetailView: View {
    @Binding var isDetailPresented: Bool
    let mapItem: MapItem
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("\(mapItem.name)")
            }
            .navigationTitle("Detail")
            .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading){
                        Button("Close"){
                            isDetailPresented.toggle()
                        }
                    }
                }
        }
        
    }
}

#Preview {
    DetailView(isDetailPresented: .constant(true), mapItem: MapItemStore.getSampleMapItem())
}
