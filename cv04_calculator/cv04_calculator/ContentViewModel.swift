//
//  ContentViewModel.swift
//  cv04_calculator
//
//  Created by David Krčmář on 14.03.2024.
//

import Foundation

class ContentViewModel{
    
    func calculate(number1: Float,number2: Float, operation: String) -> Float {
        if operation == "+"{
            return number1 + number2
        }
        if operation == "-"{
            return number1 - number2
        }
        return 0
    }
}
