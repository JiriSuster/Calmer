//
//  StyleConfig.swift
//  Calmer
//
//  Created by Jiří Daniel Šuster on 06.06.2024.
//


import SwiftUI

struct Config {
    static let backgroundColor = Color.white//Color(white: 0.9, opacity: 0.7)
    static let shadowColor = Color(white: 0.9, opacity: 0.8)
    static let shadowRadius: CGFloat = 5
    static let buttonColor: Color  = Color(.indigo)
    
    static let obhajoba: Bool = false
    static let fakeDate: Date = Date() - (1 * 3000000)
}
