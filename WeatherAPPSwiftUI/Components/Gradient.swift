//
//  Gradient.swift
//  WeatherAPPSwiftUI
//
//  Created by Daryna Polevyk on 30.10.2022.
//

import Foundation
import SwiftUI

struct GradientView: View {
    let fourColorsGradient = Gradient(colors: [Color.blue, Color.pink, Color.yellow, Color.green])
    
    var body: some View {
        Rectangle().fill(AngularGradient(gradient: fourColorsGradient, center: .topLeading))
            .edgesIgnoringSafeArea(.vertical)
            .opacity(0.7)
    }
}
