//
//  Network.swift
//  WeatherAPPSwiftUI
//
//  Created by Daryna Polevyk on 24.10.2022.
//

import Foundation
import Combine
import SwiftUI

class Network: ObservableObject {
    @Published var allWeather: WeatherModel?
    var weatherSubscribtion: AnyCancellable?
    var city = "London"
    
    let weatherMock = WeatherModel(
        coord: Coord(lon: 14.4208, lat: 50.088),
        weather: [Weather(id: 500, main: "Clear", weatherDescription: "light rain", icon: "10d")],
        base: "stations",
        main: Main(
            temp: 16.92,
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

    init() {
        getWeather(city: city)
    }

    func getWeather(city: String) {

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=924ceecf0464f8bc2531bfd9db094bc4&units=metric")
        else { return }

        let urlRequest = URLRequest(url: url)

          let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
              if let error = error {
                  print("Request error: ", error)
                  return
              }

              guard let response = response as? HTTPURLResponse else { return }

              if response.statusCode == 200 {
                  guard let data = data else { return }
                  DispatchQueue.main.async {
                      do {
                          let decodedWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
                          self.allWeather = decodedWeather
                          print("🦊: \(self.allWeather?.name) \(self.allWeather?.weather[0].main)")
                      } catch let error {
                          print("Error decoding: ", error)
                      }
                  }
              }
          }

          dataTask.resume()
    }
}

