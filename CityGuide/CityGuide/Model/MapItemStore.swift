//
//  MapItemStore.swift
//  CityGuide
//
//  Created by David Krčmář on 28.03.2024.
//

import Foundation
import MapKit


class MapItemStore {
    private var selectedMapItemID: UUID?
    
    private var items: [MapItem] = [
        MapItem(name: "Mendel university", style: .Neoclassicismus, type: .PublicBuilding, coordinates: .init(latitude: 49.210, longitude: 16.615)),
        MapItem(name: "Tugenthat", style: .Modern, type: .House, coordinates: .init(latitude: 49.207, longitude: 16.616)),
        MapItem(name: "Arboretum", style: .Baroque, type: .PublicBuilding, coordinates: .init(latitude: 49.212, longitude: 16.615))
    
    ]
    
    func getMapItems() -> [MapItem] {
        return items
    }
    
    func mapItemSelected(which: UUID) {
        self.selectedMapItemID = which
    }
    
    func getSelectedMapItem() -> MapItem? {
        return items.first(where: {$0.id == self.selectedMapItemID})
    }
    
    static func getSampleMapItem() -> MapItem{
        return MapItem(name: "Mendel university", style: .Neoclassicismus, type: .PublicBuilding, coordinates: .init(latitude: 49.210, longitude: 16.615))
    }
    
    
}
