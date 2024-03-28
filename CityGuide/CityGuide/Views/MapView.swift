//
//  MapView.swift
//  CityGuide
//
//  Created by David Krčmář on 28.03.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    private var mapItemStore: MapItemStore = MapItemStore()
    
    @State private var region = MKCoordinateRegion(center: .init(latitude: 49.210, longitude: 16.615), latitudinalMeters: 500, longitudinalMeters: 500)
    @State private var isDetailPresented: Bool = false
    
    var body: some View {
        NavigationView(){
            Map(coordinateRegion: $region, interactionModes: .all,showsUserLocation: true,userTrackingMode: .constant(.follow),annotationItems: mapItemStore.getMapItems()){item in
                MapAnnotation(coordinate: item.coordinates){
                    ZStack{
                        Circle()
                            .fill(Gradient(colors: [.white,.cyan]))
                            .frame(width: 40,height: 40)
                        item.type.symbol
                        VStack{
                            
                            Text("\(item.name)")
                            Text("\(item.style.name)")
                        }.offset(y: 40)

                        
                    }.onTapGesture {
                        mapItemStore.mapItemSelected(which: item.id)
                        isDetailPresented.toggle() //prepne na druhou hodnotu
                        }
                }

                
            }.navigationTitle("City Guide")
                .sheet(isPresented: $isDetailPresented){
                    if let mapItem = mapItemStore.getSelectedMapItem(){
                        DetailView(isDetailPresented: $isDetailPresented, mapItem: mapItem)
                    }}

        }
    }
}

#Preview {
    MapView()
}
