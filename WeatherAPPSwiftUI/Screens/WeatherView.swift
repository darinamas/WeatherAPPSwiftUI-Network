//
//  WeatherView.swift
//  WeatherAPPSwiftUI
//
//  Created by Daryna Polevyk on 24.10.2022.
//let temp = String(Int(round((Settings.shared.dailyWeather![0].temp?.day!)!))) + " " + " °" + "C"

import SwiftUI

struct WeatherView: View {
    let weather: WeatherModel
    
    @State var city = "Prague"
    @State var tempterure = "25 °"
    @State var sunriseTime = "06:25"
    @State var sunsetTime = "06:25"
    
    let fourColorsGradient = Gradient(colors: [Color.white, Color.blue, Color.green])
    
    var body: some View {
        ZStack {
          //  GradientView()
            VStack {
              
                ifWeatherImage()
                Text(weather.name ?? "Undefined")
                    .font(.title2)
                
                    Text(showTemp(temp: weather.main.temp))
                        .font(.title2)
                    Text(weather.weather[0].weatherDescription ?? "?")
                    .font(.subheadline)
                  
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(AngularGradient(gradient: fourColorsGradient, center: .topLeading))
                        .frame(width: 350, height: 100)
                        .opacity(0.9)
                    HStack {
                        VStack {
                            Text("Date")
                                .font(.headline)
                            Text("\(showDate(timestamp: weather.dt))")
                                .font(.headline)
                        }.padding()
                        VStack {
                            Text("Sunrise")
                                .font(.headline)
                            Text("\(showTime(timestamp: weather.sys.sunrise))")
                                .font(.headline)
                        }.padding()
                        
                        VStack {
                            Text("Sunset")
                                .font(.headline)
                            Text("\(showTime(timestamp: weather.sys.sunset))")
                                .font(.headline)
                        }.padding()
                    }
                }
                Spacer()
            }
        }
    }
    
    func ifWeatherImage() -> AnyView {
        if (weather.weather[0].main == "Clear") {
          return  AnyView(ImageWeatherView(imageName: "DaySun"))
        } else if (weather.weather[0].main == "Clouds") {
           return  AnyView(ImageWeatherView(imageName: "DayClouds"))
        } else if (weather.weather[0].main == "Rain") {
            return  AnyView(ImageWeatherView(imageName: "DayRain"))
        } else if (weather.weather[0].main == "Snow") {
            return  AnyView(ImageWeatherView(imageName: "DaySnow"))
        }
        else {
            return AnyView(ImageWeatherView(imageName: "NightMoon"))
        }
    }
    
    func showTime(timestamp: Int) -> String {
        let dateU = Date(timeIntervalSince1970: Double(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let strDate = dateFormatter.string(from: dateU)
        return strDate
    }
    func showDate(timestamp: Int) -> String {
        let dateU = Date(timeIntervalSince1970: Double(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let strDate = dateFormatter.string(from: dateU)
        return strDate
    }
    
    func showTemp(temp: Double) -> String {
        let tempResults = String(Int(round((temp + 1)))) + " " + " °" + "C"
        return tempResults
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: dev.weather)
    }
}

struct ImageWeatherView: View {
    var imageName = "NightMoon"
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}
