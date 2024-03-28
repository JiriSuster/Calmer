//
//  MapItem.swift
//  CityGuide
//
//  Created by David Krčmář on 28.03.2024.
//

import Foundation
import MapKit
import SwiftUI

struct MapItem: Identifiable{
    let id = UUID() //vygeneruje nahodny identifikator
    var name: String
    var style: Style
    var type: LocationType
    var coordinates: CLLocationCoordinate2D //2d souradnice lan,lon
    
}



enum Style {
    case Postmodern,Modern,Secession,Neoclassicismus,Baroque,Renessance,Gothic
    
    var name: String{
        get { return String(describing: self)}
    }
}

enum LocationType {
    case House,HouseOfFlats,PublicBuilding,Historical
    
    var symbol: Text{
        switch self {
        case .Historical:
            return Text("🏰")
        case .HouseOfFlats:
            return Text("🏢")
        case .House:
            return Text("🏠")
        case .PublicBuilding:
            return Text("🏦")
        }
    }
}
