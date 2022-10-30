//
//  Model.swift
//  WeatherAPPSwiftUI
//
//  Created by Daryna Polevyk on 30.10.2022.
//

import Foundation
import SwiftUI
import Combine

// MARK: - WeatherModel
struct WeatherModel: Identifiable, Codable {
    let coord: Coord?
    let weather: [Weather]
    let base: String?
    let main: Main
    let visibility: Int?
    let wind: Wind?
    let rain: Rain?
    let clouds: Clouds?
    let dt: Int
    let sys: Sys
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
}

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let weather = WeatherModel(
        coord: Coord(lon: 14.4208, lat: 50.088),
        weather: [Weather(id: 500, main: "Clear", weatherDescription: "light rain", icon: "10d")],
        base: "stations",
        main: Main(
            temp: -16.92,
            feelsLike: 16.94,
            tempMin: 15.71,
            tempMax: 18.82,
            pressure: 1016,
            humidity: 87),
        visibility: 10000,
        wind: Wind(speed: 2.06, deg: 170),
        rain: Rain(the1H: 0.37),
        clouds: Clouds(all: 0),
        dt: 1666606803,
        sys: Sys(type: 2, id: 2020173, country: "CZ", sunrise: 1666589902, sunset: 1666626865),
        timezone: 7200,
        id: 3067696,
        name: "PragueMOCK",
        cod: 200
    )

}

extension View {
    static var mock: DeveloperMock {
        return DeveloperMock.instance
    }
}

class DeveloperMock {
    static let instance = DeveloperMock()
    private init() { }
    
    let weather: WeatherModel = WeatherModel(coord: Coord(lon: nil, lat: nil), weather: [Weather(id: nil, main: nil, weatherDescription: nil, icon: nil)], base: nil, main: Main(temp: 0, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, humidity: 0), visibility: nil, wind: nil, rain: nil, clouds: nil, dt: 0, sys: Sys(type: nil, id: nil, country: "", sunrise: 0, sunset: 0), timezone: nil, id: nil, name: nil, cod: nil)

}
