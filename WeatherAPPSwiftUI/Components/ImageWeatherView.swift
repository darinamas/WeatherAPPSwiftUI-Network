//
//  ImageWeatherView.swift
//  WeatherAPPSwiftUI
//
//  Created by Daryna Polevyk on 30.10.2022.
//

import SwiftUI

struct ImageWeatherView: View {
    var imageName = "NightMoon"
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}
