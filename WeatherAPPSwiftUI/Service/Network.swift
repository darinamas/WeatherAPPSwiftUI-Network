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
    
    let weather: WeatherModel = WeatherModel(coord: Coord(lon: nil, lat: nil), weather: [Weather(id: nil, main: nil, weatherDescription: nil, icon: nil)], base: nil, main: Main(temp: 0, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, humidity: 0), visibility: nil, wind: nil, rain: nil, clouds: nil, dt: 0, sys: Sys(type: nil, id: nil, country: "", sunrise: 0, sunset: 0), timezone: nil, id: nil, name: nil, cod: nil)

    
    init() {
       // getWeather(city: city)
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

