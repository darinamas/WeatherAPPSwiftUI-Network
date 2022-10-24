//
//  ContentView.swift
//  WeatherAPPSwiftUI
//
//  Created by Daryna Polevyk on 24.10.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var city: String = ""
    @EnvironmentObject var network: Network
    
    var body: some View {
        
        
        
        NavigationView {
            ZStack {
                GradientView()
                VStack {
                    VStack {
                        Spacer()
                        TextField(
                            "City",
                            text: $city
                        ).onChange(of: city) { city in
                            
                        }
                        .textFieldStyle(.roundedBorder).font(.largeTitle)
                        .padding()
                        
                        NavigationLink(destination: EmptyView()){
                            Button {
                                network.getWeather(city: city)
                            } label: {
                                Text("Get Weather")
                                    .padding()
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(30)
                            }
                            
                            
                        }.padding()
                        WeatherView(weather: network.allWeather ?? network.weatherMock)
                       // Spacer()
                    }
                    .padding()
                }
              //  Spacer()
            }
            
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Network())
    }
}


struct GradientView: View {
    let fourColorsGradient = Gradient(colors: [Color.blue, Color.pink, Color.yellow, Color.green])
    
    
    var body: some View {
        Rectangle().fill(AngularGradient(gradient: fourColorsGradient, center: .topLeading))
            .edgesIgnoringSafeArea(.vertical)
            .opacity(0.7)
    }
}