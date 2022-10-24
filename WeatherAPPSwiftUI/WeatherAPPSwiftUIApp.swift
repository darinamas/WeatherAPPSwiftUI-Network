//
//  WeatherAPPSwiftUIApp.swift
//  WeatherAPPSwiftUI
//
//  Created by Daryna Polevyk on 24.10.2022.
//

import SwiftUI

@main
struct WeatherAPPSwiftUIApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(network)
        }
    }
}
