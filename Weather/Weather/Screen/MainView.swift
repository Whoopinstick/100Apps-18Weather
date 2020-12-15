//
//  ContentView.swift
//  Weather
//
//  Created by Kevin Paul on 12/12/20.
//

import SwiftUI

struct MainView: View {
    @State private var weather = Weather(lat: 10, lon: 10, timezone: "blah")
    @State private var isLoading = false
    var body: some View {
        ZStack {
            VStack {
                Text("\(weather.lat)")
                Text("\(weather.lon)")
                Text(weather.timezone)
                
            }
            
            if isLoading {
                WWProgressView()
            }
        }
        .onAppear {
            isLoading = true
            NetworkManager.shared.getWeather { [self] result in
                DispatchQueue.main.async {
                    isLoading = false
                    switch result {
                    case .success(let weather):
                        self.weather = weather
                        
                    case .failure(let error):
                        switch error {
                        case .invalidData:
                            print("")
                            
                        case .invalidURL:
                            print("")
                            
                        case .invalidResponse:
                            print("")
                            
                        case .unableToComplete:
                            print("")
                        }
                    }
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
