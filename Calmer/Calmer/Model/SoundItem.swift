//
//  SoundItem.swift
//  Calmer
//
//  Created by David Krčmář on 31.05.2024.
//

import Foundation
import SwiftUI

struct SoundItem: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var image: UIImage
    var tape: String
}
